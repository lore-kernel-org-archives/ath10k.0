Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vb0-x235.google.com ([2607:f8b0:400c:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8FdN-0007w0-43
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 20:51:49 +0000
Received: by mail-vb0-f53.google.com with SMTP id p17so579496vbe.40
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 12:51:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFED-j=c6i+LMY8gqiWeKehka7Z85b4h8xZNV9grAxkwLY1_yg@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
 <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
 <CAFED-j=c6i+LMY8gqiWeKehka7Z85b4h8xZNV9grAxkwLY1_yg@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 28 Jan 2014 15:51:06 -0500
Message-ID: <CAHqTa-3mnugb8SZU434bsNbhP1xqHrKoEVou72k95iyZLC6hyw@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
To: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On Tue, Jan 28, 2014 at 3:10 PM, Janusz Dziedzic
<janusz.dziedzic@gmail.com> wrote:
> FW636 have problems with monitor iface:
> iw wlan0 set type monitor
> ifconfig wlan0 up
> tcpdump -i wlan0
> Will always crash firmware after "entered promiscuous mode"
>
> Generally in case you will have/left only one monitor interface and
> active tcpdump (in your case after hostapd kill), you will always get
> this crash. So using monitor interface with FW636 is not good idea.
>
> BTW monitor works fine with 10.x FW.

Well, in this case it gives a mostly-reproducible test case for the
driver's failure to recover from firmware crashes.  So it's useful in
that respect.  I was using the 10.x firmware until I wanted an easier
way to reproduce the problem :)

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
