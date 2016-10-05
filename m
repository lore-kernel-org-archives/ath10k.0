Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brpEo-0006R7-Hb
 for ath10k@lists.infradead.org; Wed, 05 Oct 2016 16:40:14 +0000
Received: by mail-oi0-x233.google.com with SMTP id m72so108741418oik.3
 for <ath10k@lists.infradead.org>; Wed, 05 Oct 2016 09:39:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fuodswlu.fsf@kamboji.qca.qualcomm.com>
References: <1473801118-103112-1-git-send-email-mfaltesek@google.com>
 <87fuodswlu.fsf@kamboji.qca.qualcomm.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Wed, 5 Oct 2016 12:39:48 -0400
Message-ID: <CAOiWkA_fuhzPeF7qPP0hLN3KTZUOi6_te5Zc3+vxKQ9GRj0VBw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: cache calibration data when the core is stopped.
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Oct 3, 2016 at 3:46 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Marty Faltesek <mfaltesek@google.com> writes:
>
>> Caching calibration data allows it to be accessed when the
>> device is not active.
>>
>> Signed-off-by: Marty Faltesek <mfaltesek@google.com>
>
> No comma in the title, please.
>
> What tree did you use as the baseline? This doesn't seem to apply to
> ath.git:

We use backports 20160122 which has not been updated since earlier this year.
I can forward port it to your tree, and make sure
it builds but won't be able to test it. Will that be OK?

>
> Applying: ath10k: cache calibration data when the core is stopped.
> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/core.c).
> Repository lacks necessary blobs to fall back on 3-way merge.
> Cannot fall back to three-way merge.
> Patch failed at 0001 ath10k: cache calibration data when the core is stopped.
>
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -1227,6 +1227,42 @@ success:
>>       return 0;
>>  }
>>
>> +int
>> +ath10k_cal_data_alloc(struct ath10k *ar, void **buf)
>> +{
>> +     u32 hi_addr;
>> +     __le32 addr;
>> +     int ret;
>
> I think this function should be in debug.c. That way the code is not
> wasting memory if DEBUGFS is disabled.

ok.

>
>> +     vfree(*buf);
>> +     *buf = vmalloc(QCA988X_CAL_DATA_LEN);
>> +     if (!*buf) {
>> +             return -EAGAIN;
>> +     }
>
> Is it really necessary to allocate memory every time? What if allocate
> it only once when module is loaded, just like with
> ar->debug.fw_crash_data?

yup, good suggestion.

>
> Also please note that this patch (which I'm queuing to 4.9) touches the
> same area:
>
> ath10k: fix debug cal data file
>
> https://patchwork.kernel.org/patch/9340953/

I've modified this too, and this won't be necessary, so can you drop
it? If not, let me know and I'll
pull it in and make sure I'm based off it too.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
