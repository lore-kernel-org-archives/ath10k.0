Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mars.blocktrron.ovh ([51.254.112.43] helo=mail.blocktrron.ovh)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1j4XTS-0000wi-6t
 for ath10k@lists.infradead.org; Wed, 19 Feb 2020 22:05:44 +0000
Subject: Re: Management rate-control on IPQ4019
References: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
 <5E4C41F3.2000500@candelatech.com>
 <40026add-c28a-da90-f17a-feeb8379c544@david-bauer.net>
 <5E4D0DFA.3080409@candelatech.com>
From: David Bauer <mail@david-bauer.net>
Message-ID: <f449c08f-f59f-3543-3580-3ab132e55984@david-bauer.net>
Date: Wed, 19 Feb 2020 23:05:35 +0100
MIME-Version: 1.0
In-Reply-To: <5E4D0DFA.3080409@candelatech.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org

Hello Ben

On 2/19/20 11:29 AM, Ben Greear wrote:
> Ok, maybe so.=A0 I compile all of the wave-2 targets from the same firmwa=
re source,
> but maybe upstream 4019 firmware lags others for one reason or another.

I've just came around to test ath10k-ct with ct firmware (OpenWrt snapshot =
from today).
Beacon Frames are sent out at 6Mbit/s when legacy_rates is set to 0 for the=
 radio.

Replacing your firmware with the one from Qualcomm (ath10k-ct + non-ct firm=
ware) shows the
old picture. Management Frames are sent out at 1Mbit/s rate with this combi=
nation.

So this definitely seems to be a firmware bug. Hopefully QCA will address t=
his in an upcoming
release for users of their firmware.

Best wishes
David


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
