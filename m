Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buzNu-0000XP-Hw
 for ath10k@lists.infradead.org; Fri, 14 Oct 2016 10:06:39 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] QCA9984 VHT160 support
Date: Fri, 14 Oct 2016 10:06:12 +0000
Message-ID: <87zim79re4.fsf@kamboji.qca.qualcomm.com>
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
 <87shs4i3yi.fsf@kamboji.qca.qualcomm.com>
 <938e11ff-5989-2412-b647-25ea3977ae35@dd-wrt.com>
In-Reply-To: <938e11ff-5989-2412-b647-25ea3977ae35@dd-wrt.com> (Sebastian
 Gottschall's message of "Tue, 11 Oct 2016 03:30:50 +0200")
Content-Language: en-US
Content-ID: <3365FC835B5788469F0771E280EAD564@qualcomm.com>
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

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 10.10.2016 um 18:06 schrieb Valo, Kalle:
>> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>>
>>> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>>>
>>>> This patch adds full VHT160 support for QCA9984 chipsets
>>>> Tested on Netgear R7800. 80+80 is possible, but disabled so far since
>>>> it seems to contain glitches like missing vht station flags (this may
>>>> be firmware or mac80211 related)
>>> There are some compilation and checkpatch warnings. Also you forgot to
>>> CC linux-wireless and sent the patch as an attachment. I'll send v2 to
>>> fix those.
>
> gen_dbglog_cfg? i did not touch anything on this struct in my patch.
> this warning doesnt seem to belong to my patch

According to patchwork you did, see below. Most likely just merge damage
from rebasing, I fixed it in v2.

--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -2468,7 +2468,7 @@  ath10k_wmi_tlv_op_gen_force_fw_hang(struct ath10k *ar,
 }
 
 static struct sk_buff *
-ath10k_wmi_tlv_op_gen_dbglog_cfg(struct ath10k *ar, u64 module_enable,
+ath10k_wmi_tlv_op_gen_dbglog_cfg(struct ath10k *ar, u32 module_enable,
 				 u32 log_level) {
 	struct wmi_tlv_dbglog_cmd *cmd;
 	struct wmi_tlv *tlv;

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
