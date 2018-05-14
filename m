Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from up.icubehost.com ([185.62.36.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIJnO-00084S-2D
 for ath10k@lists.infradead.org; Mon, 14 May 2018 20:10:12 +0000
Received: from mail-ua0-f175.google.com ([209.85.217.175]:41629)
 by up.icubehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.90_1) (envelope-from <gangadharan@silex-india.com>)
 id 1fIJn7-0004ow-Mr
 for ath10k@lists.infradead.org; Tue, 15 May 2018 01:39:56 +0530
Received: by mail-ua0-f175.google.com with SMTP id a3-v6so9251132uad.8
 for <ath10k@lists.infradead.org>; Mon, 14 May 2018 13:09:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF_dkJCkH9bUW+++HX2c66XU=RNNGaT5s__PMzqFnrh1Kt=i2g@mail.gmail.com>
References: <CAF_dkJCoAxVNK7sg5iGE7cSqZq9nyf=v2e9HkhQx=K2Sv9NOCg@mail.gmail.com>
 <CAB6Vn2PcbSqc5fH719KX+7+q1ksf=CMvujdk=Z1QAj7Vs1d-3A@mail.gmail.com>
 <CAF_dkJCkH9bUW+++HX2c66XU=RNNGaT5s__PMzqFnrh1Kt=i2g@mail.gmail.com>
From: Gangadharan Vemula <gangadharan@silex-india.com>
Date: Mon, 14 May 2018 13:09:33 -0700
Message-ID: <CAB6Vn2PBQ7YKyAhP6ta8-2CkA+dWyiTSFJoDmS-QD708xmtvGQ@mail.gmail.com>
Subject: Re: Support for QCA9377
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
To: Patrick Doyle <wpdster@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, kvalo@codeaurora.org, ath10k@lists.infradead.org

On Mon, May 14, 2018 at 12:50 PM, Patrick Doyle <wpdster@gmail.com> wrote:
> On Mon, May 14, 2018 at 3:28 PM, Gangadharan Vemula
> <gangadharan@silex-india.com> wrote:
>> Hi,
>>
>> Silex patch-set was applied to master-pending branch of ath.git. Now,
>> it is in the process of getting into mainline, Mr. Kvalo is working on
>> it.
> Thank you.  I will check that out.
>

Removed from master-pending branch and new branch has been created for
ath10k-sdio-usb,

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath10k-pending-sdio-usb

I hope this is the base-branch for ath10k-sdio-usb. But, we (silex)
didn't verify anything on this branch yet.

Not sure, whether Mr.Kvalo is using this (ath10k-pending-sdio-usb)
branch for testing.

>
>> Need to apply [RFC,v3] from Mr. Erik Stromdahl.
>>
>> Patches:
>>
>> https://patchwork.kernel.org/project/ath10k/list/?submitter=164941
>
> I notice that there is now an [RFC,v4] set of patches from Mr.
> Stromdhal and that they include many/some/all? of the patches from the
> [RFC,v3] patch set.  Would it be more appropriate to apply those on
> top of the master-pending branch?
>
> --wpd

Thanks !

Best Regards,

Gangadharan Vemula,

silex technology India Pvt. Ltd.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
