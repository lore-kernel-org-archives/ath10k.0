Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eqOLV-0007i1-FC
 for ath10k@lists.infradead.org; Mon, 26 Feb 2018 19:21:59 +0000
Received: by mail-wr0-x22d.google.com with SMTP id k9so22412196wre.9
 for <ath10k@lists.infradead.org>; Mon, 26 Feb 2018 11:21:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <dd7bb2acd1be43346315d7bb349b45b2@codeaurora.org>
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
 <aedd8281-ee1b-e5ae-2521-fd3a7a221dd6@candelatech.com>
 <dd7bb2acd1be43346315d7bb349b45b2@codeaurora.org>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 26 Feb 2018 11:21:42 -0800
Message-ID: <CAJ-VmokdboP37J8csaj=xKOpiXDxXfF7wrv+cdJp+UCYFjtU_g@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath10k: send (re)assoc peer command when NSS
 changed"
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

hi,

so it's going to eventually leak? Can we fix the firmware bug too? :)


-a


On 26 February 2018 at 09:06,  <periyasa@codeaurora.org> wrote:
> Hi,
>
>
>> Can you share exactly which resource the firmware ran out of?  It would
>> seem to
>> be a FW bug if it is leaking, so maybe it can be fixed as well...
>>
>
> Firmware have total user_id = 528 (512 clients + 16 VAPs). Each user_id is
> allocated to peer when Firmware receive the WMI_PEER_ASSOC_CMDID request
> from host driver. Firmware free the user_id in peer delete operation.
>
> Regards,
> Karthikeyan P.
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
