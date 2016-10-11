Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btwY5-0007le-Ac
 for ath10k@lists.infradead.org; Tue, 11 Oct 2016 12:52:54 +0000
References: <BY2PR0201MB1512C4FEBE06285A49AAEAE4EADA0@BY2PR0201MB1512.namprd02.prod.outlook.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <78c6ac09-88f6-027c-e312-b28e693c863d@dd-wrt.com>
Date: Tue, 11 Oct 2016 14:52:22 +0200
MIME-Version: 1.0
In-Reply-To: <BY2PR0201MB1512C4FEBE06285A49AAEAE4EADA0@BY2PR0201MB1512.namprd02.prod.outlook.com>
Subject: Re: how to configure MIMO
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Gyselinck Luc <Luc.Gyselinck@technicolor.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 11.10.2016 um 12:11 schrieb Gyselinck Luc:
> Hi,
> I am using ath10k firmware for a couple of chipsets : QCA9984 (having 4x4=
 MIMO capabilities) and QCA9880 (with 3x3 MIMO capabilities).
> Is there a way to configure these chipsets only use a reduced MIMO capabi=
lity ? E.g. Can I apply a configuration so that the QCA9984 is using only 3=
x3 MIMO?
basicly you're able to configure the used tx and rx antenna chains. so =

you can run it with 3x3 and for sure you can also configure the ht / vht =

capabilities in hostapd to run it with reduced capabilities

Sebastian
> If yes can you tell me how to do so?
>
> Thanks and best regards
> Luc
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
