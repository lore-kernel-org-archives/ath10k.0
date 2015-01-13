Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB9yM-0003SR-Qh
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 22:30:03 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21685.40175.888795.836579@gargle.gargle.HOWL>
Date: Wed, 14 Jan 2015 04:02:15 +0530
Subject: Re: [ath9k-devel] Any chance for support for bluetooth on Atheros
 QCNFA wifi/bluetooth combos?
In-Reply-To: <CAO96g9+WWWR6EfRaDaOJZrHLa7tZgCWhuciK5CysfKoyhCvPZA@mail.gmail.com>
References: <CAO96g9+WWWR6EfRaDaOJZrHLa7tZgCWhuciK5CysfKoyhCvPZA@mail.gmail.com>
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
To: "Jeremy ...." <jeremy53561@gmail.com>
Cc: "ath9k-devel@lists.ath9k.org" <ath9k-devel@lists.ath9k.org>, ath10k@lists.infradead.org

Jeremy .... wrote:
> It looks like the firmware needed has changed, at least the file names
> This bug report=A0https://bugs.launchpad.net/ubuntu/+source/linux/+bug/13=
83184
> =

> The lsusb shows:=A0Bus 001 Device 003: ID 0cf3:3004 Atheros Communication=
s, Inc,
> which is supported but the dmesg shows: Bluetooth: Configuration file not
> found ar3k/ ramps_0x00000200_0.dfu and I imagine it would need the
> AthrBT_0x00000200_0.dfu

This is a card that will probably be supported by ath10k. Bluetooth support
will happen when wifi/bt coex support is added, I guess.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
