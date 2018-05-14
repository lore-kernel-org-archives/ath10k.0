Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from up.icubehost.com ([185.62.36.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIJAF-0006FM-Ky
 for ath10k@lists.infradead.org; Mon, 14 May 2018 19:29:45 +0000
Received: from mail-vk0-f41.google.com ([209.85.213.41]:38226)
 by up.icubehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.90_1) (envelope-from <gangadharan@silex-india.com>)
 id 1fIJ99-0000Qj-Mr
 for ath10k@lists.infradead.org; Tue, 15 May 2018 00:58:42 +0530
Received: by mail-vk0-f41.google.com with SMTP id u8-v6so7451406vku.5
 for <ath10k@lists.infradead.org>; Mon, 14 May 2018 12:28:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF_dkJCoAxVNK7sg5iGE7cSqZq9nyf=v2e9HkhQx=K2Sv9NOCg@mail.gmail.com>
References: <CAF_dkJCoAxVNK7sg5iGE7cSqZq9nyf=v2e9HkhQx=K2Sv9NOCg@mail.gmail.com>
From: Gangadharan Vemula <gangadharan@silex-india.com>
Date: Mon, 14 May 2018 12:28:15 -0700
Message-ID: <CAB6Vn2PcbSqc5fH719KX+7+q1ksf=CMvujdk=Z1QAj7Vs1d-3A@mail.gmail.com>
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

Hi,

Silex patch-set was applied to master-pending branch of ath.git. Now,
it is in the process of getting into mainline, Mr. Kvalo is working on
it.

As silex patches were developed on top of ath10k (which has others
developers patches from community), need to have those patches as
well.

The following branches have working version of ath10k sdio:

Boundary devices 4.9.x branch with ath10k_sdio:

https://github.com/boundarydevices/linux-imx6/tree/test-ath10k

https://github.com/erstrom/linux-ath/tree/ath-201709250721-ath10k-high-latency-silex-sdio


Need to apply [RFC,v3] from Mr. Erik Stromdahl.

Patches:

https://patchwork.kernel.org/project/ath10k/list/?submitter=164941

Refer :

https://github.com/boundarydevices/linux-imx6/commits/test-ath10k

and

https://github.com/erstrom/linux-ath/commits/ath-201709250721-ath10k-high-latency-silex-sdio

for patch dependencies.


Thanks !


Best Regards,

Gangadharan Vemula,

silex technology India Pvt. Ltd.




On Mon, May 14, 2018 at 11:09 AM, Patrick Doyle <wpdster@gmail.com> wrote:
> Hello All,
> Where can I look to learn about support for the QCA9377.  I would like
> to evaluate this module with an SDIO interface to an embedded
> (Atmel/Microchip) processor running a 4.9.x kernel.  I found
> https://patchwork.kernel.org/patch/9979563/, along with 10 other
> patches submitted by Silex in September of 2017, but it appears that
> nothing was ever done with that... or was it?
>
>
> Basically, I'm asking for some clues as to where I could start, if I
> wanted to use an open source driver with the QCA9377.
>
> Thank you.
>
> --wpd
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
