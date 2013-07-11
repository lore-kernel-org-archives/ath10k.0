Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UxISW-0002uM-40
 for ath10k@lists.infradead.org; Thu, 11 Jul 2013 15:07:04 +0000
Message-ID: <51DECA02.6070706@candelatech.com>
Date: Thu, 11 Jul 2013 08:06:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [ath9k-devel] [PATCH] ath10k: Fix crash when using v1 hardware.
References: <1372804925-1701-1-git-send-email-greearb@candelatech.com>
 <51D35D58.5090507@candelatech.com> <87txk15te4.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87txk15te4.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 07/11/2013 02:37 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> Actually, I have no idea what type of hardware this is.  It was
>> suggested earlier to me that this AP had a v1 hardware in it, but
>> lspci shows this fairly unpromising thing, and the ath10k driver
>> appears to call 003c the V2 hardware....
>>
>> 05:00.0 Network controller: Atheros Communications Inc. Device 003c (rev ff) (prog-if ff)
>> 	!!! Unknown header type 7f
>> 	Kernel modules: ath10k_pci
>
> That unknown header type looks scary. I'm starting to suspect even more
> that you have a hw problem of some sort.

I tried two different NICS extracted from two different APs and the behaviour
is the same, so it is probably not just a manufacturing error.

Please note that I do NOT have v1 firmware, though from what I could tell,
this NIC was showing up as v2 hardware anyway...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
