Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwYqL-0005cD-NT
 for ath10k@lists.infradead.org; Mon, 16 Jun 2014 15:29:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: fetching calibration data from flash
References: <5396B9F9.2070107@stackframe.org> <5396C39A.9080402@elisanet.fi>
 <87wqcpb0w1.fsf@kamboji.qca.qualcomm.com>
 <5396C8EC.4090105@elisanet.fi>
 <87sindb0gj.fsf@kamboji.qca.qualcomm.com>
 <53972A91.1080600@candelatech.com>
 <87egyvalj0.fsf@kamboji.qca.qualcomm.com>
 <53985C61.5000201@candelatech.com>
 <87ioo111pr.fsf@kamboji.qca.qualcomm.com>
 <539F04E2.9090807@candelatech.com>
Date: Mon, 16 Jun 2014 18:28:33 +0300
In-Reply-To: <539F04E2.9090807@candelatech.com> (Ben Greear's message of "Mon, 
 16 Jun 2014 07:53:22 -0700")
Message-ID: <87a99c27ry.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

Ben Greear <greearb@candelatech.com> writes:

> I also think that we will want to be able to configure firmware on
> a per-nic basis instead of per-machine.  If we did that, we could poke
> any special config into the firmware images using the existing meta-data
> api.  Should be easy enough to write a small program that prepended
> the config to a generic firmware..then those that care can create their
> own customized firmware images quickly and easily.

That's still essentially an ini file, just using a binary format hidden
inside the firmware image. The firmware meta data is for advertising
capabilities of the firmware binary so that ath10k choose correct
settings to run the binary, not for delivering configuration settings
from user space.

If we would start providing driver settings from firmware binaries that
would just confuse anyone.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
