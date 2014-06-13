Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvNvd-0001Wn-Lv
 for ath10k@lists.infradead.org; Fri, 13 Jun 2014 09:37:46 +0000
Received: by mail-vc0-f177.google.com with SMTP id ij19so1990715vcb.8
 for <ath10k@lists.infradead.org>; Fri, 13 Jun 2014 02:37:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkV9QBj+UOtm1cyxewq3cd-SjnyaAZ4+nniRvf+1gnLLw@mail.gmail.com>
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <CA+BoTQkV9QBj+UOtm1cyxewq3cd-SjnyaAZ4+nniRvf+1gnLLw@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 13 Jun 2014 05:37:03 -0400
Message-ID: <CAHqTa-2k8F45d8qXicM0N=-hg=iEJvmd8TXK-Vu4GV6x3bipqg@mail.gmail.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Fri, Jun 13, 2014 at 5:14 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 13 June 2014 01:37, Avery Pennarun <apenwarr@gmail.com> wrote:
>> We are experiencing a relatively-rare-but-not-rare-enough case which
>> has approximately these steps:
>>
>> - run a wifi AP for a while with a station or two connected
>> - shut down hostapd (stations all get disconnected of course)
>
> Did you make sure you had no interface up and running? Did the
> hardware go through warm/cold reset?

No, I didn't see any logs about that.  The firmware seemed happy.

>> - restart hostapd (perhaps on another channel or with different settings)
>>
>> After that, an external wifi sniffer can see beacons being transmitted
>> by the AP as expected, but all packets from stations trying to connect
>> are ignored.  In particular, Probe requests are not answered, and Auth
>> requests do not even receive a wifi ACK.
>
> This means WMI is working (each beacon is submitted via WMI). This
> also implies CE works.
>
> But if there are no ACKs this suggest HW must've been instructed to
> ignore frames somehow.
>
> (..) After taking a look I think wmi_vdev_start_request_cmd isn't
> really handled properly for 10.x firmware. I'm guessing this ABI issue
> might be the problem.
>
> 10.x firmware has:
>   struct wmi_channel chan;
>   __le32 vdev_id;
>   __le32 requestor_id;
>   __le32 num_noa_descriptors;
>   __le32 disable_hw_ack;
>   struct wmi_p2p_noa_descriptor noa_descriptors[2];
>
> disable_hw_ack overlaps with dtim_period. Perhaps that's the problem.
>
> It's intriguing how this hasn't manifested itself until now..

I'm not sure what you mean by overlapping...

>> Restarting hostapd doesn't fix it.  However, rmmoding and modprobing
>> the ath10k_pci module does fix it.
>
> Did the hardware go through warm or cold reset?

Reloading the driver, I believe it does a warm reset.  I know it's not
doing a cold reset because that tends to crash my machine :)

>> This is with a mindspeed c2k host processor, 3.2 kernel, and modules
>> backported by backports from kvalo's ath-next as of
>> v3.15-rc1-237-gd9bc4b9 (roughly 2014-04-29).  Firmware is
>> 10.1.467.2-1.
>>
>> Has anyone else seen this?  Any suggestions where to look to narrow
>> down the problem?
>
> I haven't seen anything like this.
>
> For one reloading the driver may tickle cfg80211 and regulatory
> updates but I just can't imagine how that could cripple ACKing.

Just to clarify, reloading the driver fixes it, it doesn't cripple it.
It's restarting hostapd that seems to cripple it.

>> I can't exactly produce it on demand yet, but if someone suggests
>> things to look for when it happens, it occurs often enough that I
>> should be able tor run those things.
>
> You might want to print out the vdev_start command's dtim_period
> (which overlaps with 10.x's disable_hw_ack) before it is sent to fw
> and compare the value for when ACKing works and when it doesn't.

Do you mean printing the dtim_period we are sending to the firmware,
from inside vdev_start(), and watching to see if it is ever different
than expected?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
