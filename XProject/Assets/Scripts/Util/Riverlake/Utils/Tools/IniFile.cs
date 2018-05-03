﻿using System.IO;
using UnityEngine;
//using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UR = UnityEngine.Resources;

/*
 * Haikun Huang
 * 
 * IniFile
 * 
 * This tool use to read the formatted file such as below:
 * 
 * [selector]
 * name = value
 * 
 * */

namespace Riverlake
{
    public class IniFile
    {
        bool debug = false;
        string fileName;
        Dictionary<string, Dictionary<string, string>> storedData;

        Dictionary<string, string> currentSelctor;

        // please make sure use the Application.dataPath in order to define the file path
        public IniFile(string _fileString, bool _debug = false)
        {
            debug = _debug;
            storedData = new Dictionary<string, Dictionary<string, string>>();
            Clear();

            Read_From_String(_fileString);
        }

        public IniFile(bool _debug = false)
        {
            debug = _debug;
            storedData = new Dictionary<string, Dictionary<string, string>>();
            Clear();
        }

        public void Clear()
        {
            // clear the storedData 
            storedData.Clear();
            currentSelctor = null;
        }

        // Read from the string and store the data
        public void Read_From_String(string data)
        {
            if (debug)
            {
                Debug.Log("IniFile Read String: " + data);
            }

            string[] lines = data.Split('\n');
            for (int i = 0; i < lines.Length; i++)
            {
                string line = lines[i];
                line = line.Trim();
                if (line.Length == 0)
                    continue;

                // if any line begin with a char '#', that means this line is a comment line, then skip it
                if (line.ToCharArray()[0] == '#')
                    continue;

                // if any line begin with a char '[', that means this line is a selctor, then create a new selctor
                if (line.ToCharArray()[0] == '[')
                {

                    line = line.Split('[')[1].Split(']')[0];
                    line = line.Trim();

                    if (!storedData.ContainsKey(line))
                    {
                        currentSelctor = new Dictionary<string, string>();
                        currentSelctor.Clear();

                        // add the new selctor to storedData
                        storedData.Add(line, currentSelctor);
                    }
                    else
                    {
                        // use a exist selctor;
                        currentSelctor = storedData[line];
                    }
                    continue;
                }

                // otherwise, should be the name = value pairs
                else
                {
                    int index = line.IndexOf('=');
                    if( index < 0 )
                        continue;

                    string key = line.Substring(0, index);
                    string value = line.Substring(index + 1, line.Length - index -1);

                    // add the pair to the current selctor
                    if (currentSelctor != null)
                    {
                        currentSelctor.Add(key, value);
                    }

                    continue;
                }
            }
            // clear currentSelctor
            currentSelctor = null;

        } // end read

        // Read from the file and store the data
        public void Read_From_Resource(string _fileName)
        {
            Object obj = UR.Load<Object>(_fileName);

            if (debug)
            {
                Debug.Log("IniFile Read File from Resource:\n" + obj);
            }

            Read_From_String(obj.ToString());

        } // end read

        // Read from the file and store the data
        public void Read_From_File(string _fileName)
        {
            string content = File.ReadAllText(_fileName);

            if (debug)
            {
                Debug.Log("IniFile Read File: " + _fileName);
            }

            Read_From_String(content);
        } // end read

        // locate the specify selctor, if the selctor no existed, return false and clear the currentSelctor
        public bool goTo(string selctor)
        {
            if (!storedData.ContainsKey(selctor))
            {
                return false;
            }

            currentSelctor = storedData[selctor];
            return true;
        }

        // get the value by name
        public string GetValue_String(string _name, string defaultValue = "")
        {
            string value = defaultValue;

            if (currentSelctor != null)
            {
                if (currentSelctor.ContainsKey(_name))
                {
                    value = currentSelctor[_name];
                }
            }
            return value;

        }

        // get the int by name
        public int GetValue_Int(string _name, int defaultValue = 0)
        {
            return int.Parse(GetValue_String(_name, defaultValue + ""));
        }

        // get the float by name
        public float GetValue_Float(string _name, float defaultValue = 0.0f)
        {
            return float.Parse(GetValue_String(_name, defaultValue + ""));
        }

        // is contains the specify name
        public bool IsContainsName(string _name)
        {
            if (currentSelctor != null)
            {
                return currentSelctor.ContainsKey(_name);
            }
            return false;
        }

        // set a selctor
        public void SetSelctor(string selctor)
        {
            // clear current selctor
            currentSelctor = null;
            if (storedData.ContainsKey(selctor))
            {
                // use the exist one
                currentSelctor = storedData[selctor];
            }
            else
            {
                // add a new one
                currentSelctor = new Dictionary<string, string>();
                storedData.Add(selctor, currentSelctor);
            }
        }

        // set a new string
        public void SetString(string _name, string _value)
        {
            if (currentSelctor == null)
                return;

            if (currentSelctor.ContainsKey(_name))
            {
                // update the value
                currentSelctor[_name] = _value;
            }
            else
            {
                // add a new value
                currentSelctor.Add(_name, _value);
            }
        }

        // set a new int
        public void SetInt(string _name, int _value)
        {
            SetString(_name, _value.ToString());
        }

        // set a new float
        public void SetFloat(string _name, float _value)
        {
            SetString(_name, _value.ToString());
        }

        public void RemoveSelector(string _name)
        {
            if (storedData.ContainsKey(_name))
            {
                if (currentSelctor == storedData[_name])
                    currentSelctor = null;
                storedData[_name].Clear();
                storedData.Remove(_name);
            }
        }

        // toString
        public override string ToString()
        {
            StringBuilder buf = new StringBuilder();
            foreach (string selctor in storedData.Keys)
            {
                buf.AppendFormat("[{0}]\n" , selctor );
                Dictionary<string, string> curSel = storedData[selctor];
                foreach (string key in curSel.Keys)
                {
                    buf.AppendFormat("{0}={1}\n" , key , curSel[key]);
                }
            }
            return buf.ToString();
        }

    }

}
