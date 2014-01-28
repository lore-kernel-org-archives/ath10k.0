Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8DvQ-0005aP-2G
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 19:02:20 +0000
Message-ID: <52E7FE94.9000608@candelatech.com>
Date: Tue, 28 Jan 2014 11:01:40 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <52E7F4F2.2030001@candelatech.com>
 <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
In-Reply-To: <CAHqTa-2JvvRA2v3y5YF8ku02zwxzpotGDQqOUU2FkxzkQgeBAg@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 01/28/2014 10:34 AM, Avery Pennarun wrote:
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
> This doesn't *always* work, but it kills the firmware maybe half the
> time for me.  It may or may not be worse if there are clients
> connected and pushing traffic.  I've noticed that once the firmware
> has crashed once and recovered, it's hard to crash it again using the
> same trick without unloading and reloading the driver.  Note that in
> this case, the firmware crash doesn't always kill my host SoC with a
> bus error (although sometimes it does).  Even if it doesn't die
> completely, the driver generally comes out confused about the
> monitoring interface(s): it prints "ath10k: Only one monitor interface
> allowed", which is actually totally untrue, since before the crash I
> was able to create and use two at a time.  (I think this error is a
> side effect of getting out of sync with the firmware when it restarts,
> and thus getting confused about "pmon" vs "vmon" monitor interfaces.)
> 
> Also, if I leave the ath10k driver running and pushing traffic for,
> say, 10 minutes, the probability that the firmware will crash *and*
> take my SoC with it, if I try to kill hostapd or unload the driver,
> approaches 100%.

I see similar issues (with the reset killing the PC) on x86-64
(core-i7 CPU).  Kalle mentioned a few days ago that at least some of the
NICs had issues with cold reset and that they hoped to
have a fix that uses warm reset in a week or two.

Interestingly, I also see hard PC lockup on longer runs, but
perhaps that is related to the cold-reset issue somehow.

I'm using the 10.x AP firmware, and my method of crashing firmware
is different at the moment :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
