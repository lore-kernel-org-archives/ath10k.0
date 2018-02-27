Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqWRG-0004UE-01
 for ath10k@lists.infradead.org; Tue, 27 Feb 2018 04:00:27 +0000
MIME-Version: 1.0
Date: Tue, 27 Feb 2018 09:30:14 +0530
From: periyasa@codeaurora.org
Subject: Re: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS
 changed"
In-Reply-To: <CAJ-VmokdboP37J8csaj=xKOpiXDxXfF7wrv+cdJp+UCYFjtU_g@mail.gmail.com>
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
 <aedd8281-ee1b-e5ae-2521-fd3a7a221dd6@candelatech.com>
 <dd7bb2acd1be43346315d7bb349b45b2@codeaurora.org>
 <CAJ-VmokdboP37J8csaj=xKOpiXDxXfF7wrv+cdJp+UCYFjtU_g@mail.gmail.com>
Message-ID: <83292eb1f9fe6bd2ee9ef82e80693388@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: adrian.chadd@gmail.com, Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

This is not a bug, Firmware treats every WMI_PEER_ASSOC_CMDID as a new 
peer assoc. so driver should not give WMI_PEER_ASSOC_CMDID for the 
already associated peer.
For the NSS update, wmi_peer_set_param is enough to update the new NSS 
value.

Regards,
Karthikeyan P.

On 2018-02-27 00:51, Adrian Chadd wrote:
> hi,
> 
> so it's going to eventually leak? Can we fix the firmware bug too? :)
> 
> 
> -a
> 
> 
> On 26 February 2018 at 09:06,  <periyasa@codeaurora.org> wrote:
>> Hi,
>> 
>> 
>>> Can you share exactly which resource the firmware ran out of?  It 
>>> would
>>> seem to
>>> be a FW bug if it is leaking, so maybe it can be fixed as well...
>>> 
>> 
>> Firmware have total user_id = 528 (512 clients + 16 VAPs). Each 
>> user_id is
>> allocated to peer when Firmware receive the WMI_PEER_ASSOC_CMDID 
>> request
>> from host driver. Firmware free the user_id in peer delete operation.
>> 
>> Regards,
>> Karthikeyan P.
>> 
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
