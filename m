Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwZIu-0001np-27
 for ath10k@lists.infradead.org; Mon, 16 Jun 2014 15:58:40 +0000
Message-ID: <539F1417.10008@candelatech.com>
Date: Mon, 16 Jun 2014 08:58:15 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org> <5396C39A.9080402@elisanet.fi>
 <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com> <5396C8EC.4090105@elisanet.fi>
 <87sindb0gj.fsf@kamboji.qca.qualcomm.com> <53972A91.1080600@candelatech.com>
 <87egyvalj0.fsf@kamboji.qca.qualcomm.com> <53985C61.5000201@candelatech.com>
 <87ioo111pr.fsf@kamboji.qca.qualcomm.com> <539F04E2.9090807@candelatech.com>
 <87a99c27ry.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87a99c27ry.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

On 06/16/2014 08:28 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I also think that we will want to be able to configure firmware on
>> a per-nic basis instead of per-machine.  If we did that, we could poke
>> any special config into the firmware images using the existing meta-data
>> api.  Should be easy enough to write a small program that prepended
>> the config to a generic firmware..then those that care can create their
>> own customized firmware images quickly and easily.
> 
> That's still essentially an ini file, just using a binary format hidden
> inside the firmware image. The firmware meta data is for advertising
> capabilities of the firmware binary so that ath10k choose correct
> settings to run the binary, not for delivering configuration settings
> from user space.
> 
> If we would start providing driver settings from firmware binaries that
> would just confuse anyone.

Ok.  I'll post to netdev to see if anyone else has figured out
a good way to configure info before loading firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
