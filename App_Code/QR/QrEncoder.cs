using System;
using snow.qr.generator.decoder;
using snow.qr.generator.encoder;

namespace sc.QrCodeGenerator.Encoding
{
    public class QrEncoder
    {
        public ErrorCorrectionLevel ErrorCorrectionLevel { get; set; }

        public QrEncoder()
            : this(ErrorCorrectionLevel.M)
        {

        }

        public QrEncoder(ErrorCorrectionLevel errorCorrectionLevel)
        {
            ErrorCorrectionLevel = errorCorrectionLevel;
        }

        public QrCode Encode(string content)
        {
            ErrorCorrectionLevelInternal level = ErrorCorrectionLevelConverter.ToInternal(this.ErrorCorrectionLevel);
            QRCodeInternal qrCodeInternal = new QRCodeInternal();
            EncoderInternal.encode(content, level, qrCodeInternal);
            return new QrCode(qrCodeInternal);
        }
    }
}
