Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8DVg-0004qk-DP
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 18:35:45 +0000
Received: by mail-vc0-f179.google.com with SMTP id lh14so492662vcb.38
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 10:35:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52E7F4F2.2030001@candelatech.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 28 Jan 2014 13:34:59 -0500
Message-ID: <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Jan 28, 2014 at 1:20 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 01/28/2014 09:18 AM, Avery Pennarun wrote:
>> When the ath10k firmware crashes on my device (let's not worry about
>> why the firmware crashes right now; one problem at a time), my host
>> CPU (ARMv7 based) can't recover.  I get some variant of this error:
>
> I don't know about your pci bus problem, but I'm interested in knowing
> about firmware crashes (if you are at liberty to share the details).

Well, since you asked... :)

I'm trying to build an especially robust system here, so when I
noticed that the driver will bring the entire system crashing down
upon a firmware crash, I've actually gone out of my way to make more
firmware crashes.  So I'm using the ath10k (not ap) firmware from a
month or so ago, in AP mode.  It's pretty easy to crash the firmware
with a sequence something like this:

- start hostapd (I'm using channel 36, HT20, no encryption)
# note that hostapd already adds a mon.wlan0 monitor interface
- iw wlan0 interface add mon0 type monitor
- ip link set mon0 up
- tcpdump -ni mon0 | head

This doesn't *always* work, but it kills the firmware maybe half the
time for me.  It may or may not be worse if there are clients
connected and pushing traffic.  I've noticed that once the firmware
has crashed once and recovered, it's hard to crash it again using the
same trick without unloading and reloading the driver.  Note that in
this case, the firmware crash doesn't always kill my host SoC with a
bus error (although sometimes it does).  Even if it doesn't die
completely, the driver generally comes out confused about the
monitoring interface(s): it prints "ath10k: Only one monitor interface
allowed", which is actually totally untrue, since before the crash I
was able to create and use two at a time.  (I think this error is a
side effect of getting out of sync with the firmware when it restarts,
and thus getting confused about "pmon" vs "vmon" monitor interfaces.)

Also, if I leave the ath10k driver running and pushing traffic for,
say, 10 minutes, the probability that the firmware will crash *and*
take my SoC with it, if I try to kill hostapd or unload the driver,
approaches 100%.

These are all problems worth worrying about, of course, but
fundamentally I really want to get the resets working.  The driver
resets in about one second when it *doesn't* crash, which is pretty
gross, but at least it means we can recover when the firmware is
crappy.  The especially crappy firmware right now makes it easier to
test the recovery process in the driver, which I want to fix first if
possible.  Once I feel good that it can recover from crashes, I will
be happier to complain about the actual crashes themselves :)

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
