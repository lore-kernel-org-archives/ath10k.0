Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vaq2O-0002oT-Of
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 16:51:33 +0000
Message-ID: <526E95F4.1010904@candelatech.com>
Date: Mon, 28 Oct 2013 09:51:00 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: README for the ath10k firmware repository?
References: <5265A58B.8000403@candelatech.com>
 <87a9htephy.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a9htephy.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 10/28/2013 02:03 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I noticed some new firmware images were added to the ath10k firmware
>> repository ( https://github.com/kvalo/ath10k-firmware.git).
>>
>> Could someone that knows add a small README that describes what firmware
>> does what?
> 
> I added a small readme and wrote a bit more information to the wiki:
> 
> https://github.com/kvalo/ath10k-firmware
> http://wireless.kernel.org/en/users/Drivers/ath10k/firmware
> 
> Do those help?
> 
>> For instance, I was thinking that maybe I should rename firmware-2.bin
>> to firmware.bin on the host machine in order to use it..but that makes
>> my system not boot.
> 
> You should not rename the files, except firmware-2.bin-10.1.389 ->
> firmware-2.bin.

Yes, that does help.

It is correct to say that if firmware-2.bin exists then the
firmware.bin and otp.bin will always be ignored for recent
ath10k drivers?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
