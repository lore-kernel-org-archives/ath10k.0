Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZrO7-000657-Sp
 for ath10k@lists.infradead.org; Thu, 10 Sep 2015 02:15:00 +0000
Received: by qgx61 with SMTP id 61so24674819qgx.3
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 19:14:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55F0B995.40407@candelatech.com>
References: <55CCDBF9.2050205@candelatech.com>
 <CAJn6HhvrmvXFTyxAuxXpbVmQZK6qSRKXJPJkwBY3NfjgPHWECw@mail.gmail.com>
 <55F0B995.40407@candelatech.com>
Date: Thu, 10 Sep 2015 05:14:38 +0300
Message-ID: <CAJn6HhuEdaufq_oHz8f2+ETcGEXqBj77iOrt=C4Za+7QtD_i3Q@mail.gmail.com>
Subject: Re: New CT firmware beta-15 available.
From: Igor Pavlov <igor.arabesc.pavlov@gmail.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Ben Greear <greearb@candelatech.com>

2015-09-10 1:58 GMT+03:00 Ben Greear <greearb@candelatech.com>:
> Does it act any better if you use the official 'firmware-2.bin'
> for firmware?

No, it's unstable.
I haven't found stable firmware version yet.

I tried firmware-4.bin (md5: eca8fd35aec383278223efdf35a00f33,
0067c0c5dff032fd45137815cdd15134) with the fresh Arch Linux, it's
unstable too:
# uname -a
Linux 4.1.2-2-ARCH #1 SMP PREEMPT Wed Jul 15 08:30:32 UTC 2015 x86_64 GNU/Linux

> What kernel/backport is your OpenWRT based on?

It's standard OpenWRT image from there:
https://downloads.openwrt.org/chaos_calmer/15.05-rc3/x86/64/

# uname -a
Linux 3.18.17 #1 SMP Fri Jul 3 20:58:35 CEST 2015 x86_64 GNU/Linux

--
Igor

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
