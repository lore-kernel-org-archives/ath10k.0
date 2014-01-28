Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8EzJ-00076K-R4
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 20:10:26 +0000
Received: by mail-ie0-f172.google.com with SMTP id e14so1065186iej.3
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 12:10:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
 <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
Date: Tue, 28 Jan 2014 21:10:01 +0100
Message-ID: <CAFED-j=c6i+LMY8gqiWeKehka7Z85b4h8xZNV9grAxkwLY1_yg@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

2014-01-28 Avery Pennarun <apenwarr@gmail.com>:
> On Tue, Jan 28, 2014 at 1:20 PM, Ben Greear <greearb@candelatech.com> wrote:
>> On 01/28/2014 09:18 AM, Avery Pennarun wrote:
>>> When the ath10k firmware crashes on my device (let's not worry about
>>> why the firmware crashes right now; one problem at a time), my host
>>> CPU (ARMv7 based) can't recover.  I get some variant of this error:
>>
>> I don't know about your pci bus problem, but I'm interested in knowing
>> about firmware crashes (if you are at liberty to share the details).
>
> Well, since you asked... :)
>
> I'm trying to build an especially robust system here, so when I
> noticed that the driver will bring the entire system crashing down
> upon a firmware crash, I've actually gone out of my way to make more
> firmware crashes.  So I'm using the ath10k (not ap) firmware from a
> month or so ago, in AP mode.  It's pretty easy to crash the firmware
> with a sequence something like this:
>
> - start hostapd (I'm using channel 36, HT20, no encryption)
> # note that hostapd already adds a mon.wlan0 monitor interface
> - iw wlan0 interface add mon0 type monitor
> - ip link set mon0 up
> - tcpdump -ni mon0 | head
>
FW636 have problems with monitor iface:
iw wlan0 set type monitor
ifconfig wlan0 up
tcpdump -i wlan0
Will always crash firmware after "entered promiscuous mode"

Generally in case you will have/left only one monitor interface and
active tcpdump (in your case after hostapd kill), you will always get
this crash. So using monitor interface with FW636 is not good idea.

BTW monitor works fine with 10.x FW.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
