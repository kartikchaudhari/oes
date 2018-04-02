using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Linq;

namespace oes.student.Class
{
    public class Answer
    {
       
        private string _questionID;
        private string _correctAnswer;
        private string _userAnswer;
        private string _result;
        private int _marksOfQuestion;
        private int CountCorrectAns;
        public string QuestionID
        {
            get { return _questionID; }
            set { _questionID = value; }
        }

        public string CorrectAnswer
        {
            get { return _correctAnswer; }
            set { _correctAnswer =value; }
        }

        public string UserAnswer
        {
            get { return _userAnswer; }
            set { _userAnswer = value; }
        }

        public ResultValue Result
        {
            get
            {
                if (_userAnswer == _correctAnswer)
                {
                    CountCorrectAns += _marksOfQuestion;
                    return ResultValue.Correct;
                }
                else
                {
                    return ResultValue.Incorrect;
                }
            }
        }

        public enum ResultValue { Correct, Incorrect }
        
        public int MarksOfQuestion
        {
            get { return _marksOfQuestion; }
            set { _marksOfQuestion = value; }
        }


        public override string ToString()
        {
            return CountCorrectAns.ToString();
              
        } 
        
    }

}