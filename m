Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WurwI-0001kv-Lc
 for ath10k@lists.infradead.org; Wed, 11 Jun 2014 23:28:19 +0000
Message-ID: <5398E5FC.4010307@candelatech.com>
Date: Wed, 11 Jun 2014 16:27:56 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: basic help request
References: <CFBE5A89.B257D%pete@sablalik.us>
In-Reply-To: <CFBE5A89.B257D%pete@sablalik.us>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Peter Sabat <pete@sablalik.us>
Cc: ath10k@lists.infradead.org

On 06/11/2014 04:12 PM, Peter Sabat wrote:
> Hoping that I can possibly get a pointer on what I=B9m doing wrong w/ ath=
10k
> and hostapd.
> =

> I=B9m running a 3.14 kernel and installed the 3.15-rc-1 backports. I can
> start hostapd, but no matter what I do, I can=B9t see the SSID. I have al=
so
> just tried to use N by itself.
> =

> I am using a WLE900V5-23 card.
> =

> The things that I=B9ve noticed so far is that I am unable to use the v2
> firmware =AD additionally, even w/ the v1 firmware, I get a:
> =

> ath10k: Invalid firmware magic

....

> filename:       =

> /lib/modules/3.14.4-scst/updates/drivers/net/wireless/ath/ath10k/ath10k_p=
ci
> .ko
> firmware:       ath10k/QCA988X/hw2.0/board.bin
> firmware:       ath10k/QCA988X/hw2.0/otp.bin
> firmware:       ath10k/QCA988X/hw2.0/firmware.bin

You need firmware-2.bin.  Please get the 4.1.467-2.1 version firmware and p=
ut it
in your firmware directory...

What OS is this?

Thanks,
Ben


-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
