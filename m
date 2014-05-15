Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkpWF-0003Z4-9h
 for ath10k@lists.infradead.org; Thu, 15 May 2014 06:51:55 +0000
Received: by mail-ve0-f176.google.com with SMTP id jz11so738855veb.21
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 23:51:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-06PwRvYgf44Fym=wYMPtBUNe100H3WZGT0Bc2yYYc6Og@mail.gmail.com>
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
 <53726148.3090503@candelatech.com>
 <CAHqTa-111nY-nqiU99HkwAermVEE8zotVFg3VDA4AMtZyCKUcw@mail.gmail.com>
 <87mwekh7ds.fsf@kamboji.qca.qualcomm.com>
 <CAEFj9861oYh=RDOxSgLev0L713dQnzez+1ja5duufAdhTJ4jKA@mail.gmail.com>
 <CAHqTa-06PwRvYgf44Fym=wYMPtBUNe100H3WZGT0Bc2yYYc6Og@mail.gmail.com>
Date: Thu, 15 May 2014 14:51:32 +0800
Message-ID: <CAEFj986gqX0BgZBBunpd5iUfcYBNYA_4u=4DLjEqrdBLtvvJxQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Kalle Valo <kvalo@qca.qualcomm.com>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

It's my own mistake while patching the patch.

Anyway, I can share my test method:

AP: (ath10k)
1. iw phy0 set antenna 1 1 (1 tx chainmask and 1 rx chainmask)
2. Use hostapd to bring up 80MHz AP

STA: (ath10k)
1. ifconfig wlan0
2. iw wlan0 connect SSID
3. echo 0x200 > /sys/module/ath10k_core/parameters/debug_mask
4. Check the "vht_nss", it should be based on your configuration of
antenna, such as vht_nss = 1 for 1 tx chainmask in AP

---
Chun-Yeow

On Thu, May 15, 2014 at 1:47 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
> On Thu, May 15, 2014 at 12:04 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Sorry for all the noise. The patch is indeed working.
>>
>> I have verified that the number of spatial streams are reduced
>> accordingly if you reduce the tx chainmask.
>
> Hi, can you give a hint what you might have been doing wrong during
> your test, in order to help others in the future?
>
> Thanks,
>
> Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
