Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF8MM-0007UY-Tp
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 23:12:03 +0000
References: <57686587.9050607@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <1c702fd0-677c-82e3-ddbe-ab4335a4a1a6@dd-wrt.com>
Date: Tue, 21 Jun 2016 01:11:35 +0200
MIME-Version: 1.0
In-Reply-To: <57686587.9050607@candelatech.com>
Subject: Re: Stand-alone ath10k-ct driver.
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
To: ath10k@lists.infradead.org

Am 20.06.2016 um 23:52 schrieb Ben Greear:
> Hello!
>
> I have made an attempt to provide a stand-alone ath10k driver that =

> should compile
> and work against stock 4.7 kernels.  This should provide better =

> support for CT ath10k
> firmware without having to apply large numbers of patches.  My 4.7 =

> kernel has only been very lightly tested
> to date, and the stand-alone driver is only compile tested.  I will =

> update the
> ath-ct repo often as testing progresses on 4.7.
>
> If there are brave souls that want to try it out, I'd appreciate any =

> feedback.
>
> https://github.com/greearb/ath-ct
>
> See the README.txt for some details.  This will require at least some =

> familiarity
> with building kernels since I do not have any nice automation to =

> compile against
> the current running kernel yet, for instance.
>
why dont you use compat-wireless / backports as base?
so you can use your driver in any kernel version
> Thanks,
> Ben
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
