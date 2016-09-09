Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biPpU-000855-Ei
 for ath10k@lists.infradead.org; Fri, 09 Sep 2016 17:43:09 +0000
Received: by mail-oi0-x231.google.com with SMTP id y2so155157815oie.0
 for <ath10k@lists.infradead.org>; Fri, 09 Sep 2016 10:42:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Fri, 9 Sep 2016 13:42:46 -0400
Message-ID: <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
Subject: Re: accessing ath10k calibration data
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>, ath10k@lists.infradead.org

It's blocked by the code below which I tried to ifdef out, but then it
returns all 0's.

diff --git a/drivers/net/wireless/ath/ath10k/debug.c
b/drivers/net/wireless/ath/ath10k/debug.c
index 8b01e3e..bb8b7ec 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -1433,12 +1433,13 @@ static int ath10k_debug_cal_data_open(struct
inode *inode, struct file *file)
        int ret;

        mutex_lock(&ar->conf_mutex);
-
+#if 0
        if (ar->state != ATH10K_STATE_ON &&
            ar->state != ATH10K_STATE_UTF) {
                ret = -ENETDOWN;
                goto err;
        }
+#endif

On Fri, Sep 9, 2016 at 1:39 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> Hi,
>
> It's just in OTP? You should be able to read the OTP data without
> needing a STA/AP up?
>
>
> -a
>
>
> On 9 September 2016 at 10:35, Marty Faltesek <mfaltesek@google.com> wrote:
>> Is there a way to access calibration data without having to start an
>> AP (or client)?
>>
>> Thanks,
>>
>> Marty
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
