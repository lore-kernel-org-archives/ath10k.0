Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mars.blocktrron.ovh ([51.254.112.43] helo=mail.blocktrron.ovh)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1j4Bwu-0001o2-LK
 for ath10k@lists.infradead.org; Tue, 18 Feb 2020 23:06:43 +0000
Subject: Re: Management rate-control on IPQ4019
References: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
 <5E4C41F3.2000500@candelatech.com>
From: David Bauer <mail@david-bauer.net>
Message-ID: <40026add-c28a-da90-f17a-feeb8379c544@david-bauer.net>
Date: Wed, 19 Feb 2020 00:06:25 +0100
MIME-Version: 1.0
In-Reply-To: <5E4C41F3.2000500@candelatech.com>
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
Cc: ath10k@lists.infradead.org

Hello Ben,

On 2/18/20 8:58 PM, Ben Greear wrote:
> On 02/18/2020 11:12 AM, David Bauer wrote:
>> Hello,
>>
>> while playing around with the 2.4GHz WiFi part of the IPQ4019, i was
>> expecting being able to set the rate at which IPQ4019 transmits it's bea=
con
>> frames.
>>
>> Using OpenWrt, setting "legacy_rates=3D0" on the radio leads to only adv=
ertising
>> 802.11g speeds, however the beacons are still sent out at 1 Mbit/s. Usin=
g a QCA9984,
>> the beacons are correctly sent out at the lowest 802.11g rate (6 Mbit/s)=
. So i assume
>> this is either a bug in the ath10k firmware or a hardware-shortcoming. H=
as anyone else
>> experienced this bug and is it likely we'll see it fixed in a later firm=
ware release?
>>
>> Hardware: IPQ4029 (Aruba AP-303)
>> Firmware=A0 Version: 10.4-3.6-00140 / 10.4-3.5.3-00078
> =

> There are separate API for setting management frame rates.=A0 I forget ex=
actly how
> upstream supports this, but maybe check debugfs?

I'm using the mac80211 interface here [0], which works well for the QCA9984=
, but not for
the IPQ4019. I'm not aware of a debugfs interface with ath10k for setting t=
he management
rate.

I can try the one ath10k-ct implements, but the fact it works on the QCA998=
4 makes me believe
the culprit is the firmware. The patch adding support for mgmt-rate setting=
 does not list the
IPQ4019 as a tested platform also.

[0] https://patchwork.kernel.org/patch/10593573/

Best wishes
David

> =

> Thanks,
> Ben
> =

> =


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
