Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btd6U-00067B-Nm
 for ath10k@lists.infradead.org; Mon, 10 Oct 2016 16:07:03 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] QCA9984 VHT160 support
Date: Mon, 10 Oct 2016 16:06:14 +0000
Message-ID: <87shs4i3yi.fsf@kamboji.qca.qualcomm.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
 <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
 <87lgyug42q.fsf@kamboji.qca.qualcomm.com>
 <bd2ae01e-6cf5-837e-5573-1d62bbfdbe1b@dd-wrt.com>
 <8737l2ee1y.fsf@kamboji.qca.qualcomm.com>
 <5c915231-db74-a147-f904-21c09d8a1ff0@dd-wrt.com>
 <87wphgi41c.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wphgi41c.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 10 Oct 2016 19:04:31 +0300")
Content-Language: en-US
Content-ID: <EA930D46F924F4428213C84BC01CCFFD@qualcomm.com>
MIME-Version: 1.0
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> This patch adds full VHT160 support for QCA9984 chipsets
>> Tested on Netgear R7800. 80+80 is possible, but disabled so far since
>> it seems to contain glitches like missing vht station flags (this may
>> be firmware or mac80211 related)
>
> There are some compilation and checkpatch warnings. Also you forgot to
> CC linux-wireless and sent the patch as an attachment. I'll send v2 to
> fix those.

Forgot the actual warnings:

drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:2: warning: (near initialization for 'wmi_tlv_ops.gen_dbglog_cfg') [enabled by default]
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27: warning: incorrect type in initializer (incompatible argument 2 (different type sizes))
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27:    expected struct sk_buff *( *gen_dbglog_cfg )( ... )
drivers/net/wireless/ath/ath10k/wmi-tlv.c:3520:27:    got struct sk_buff *( static [toplevel] *<noident> )( ... )
drivers/net/wireless/ath/ath10k/wmi-tlv.h:546: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/wmi-tlv.h:546: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/mac.c:2556: braces {} should be used on all arms of this statement
drivers/net/wireless/ath/ath10k/mac.c:2560: line over 90 characters
drivers/net/wireless/ath/ath10k/mac.c:4301: line over 90 characters
drivers/net/wireless/ath/ath10k/mac.c:4301: braces {} are not necessary for single statement blocks

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
