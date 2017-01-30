Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYBWX-00005x-UA
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 12:57:35 +0000
Received: by mail-vk0-f49.google.com with SMTP id r136so214855393vke.1
 for <ath10k@lists.infradead.org>; Mon, 30 Jan 2017 04:57:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8737g1t1mh.fsf@kamboji.qca.qualcomm.com>
References: <CAMVG2ssLQ897kVVE2jZrqsDm2XFmq7snoOG649FgGEogVjWX7g@mail.gmail.com>
 <87y3xw4ieo.fsf@kamboji.qca.qualcomm.com>
 <CAMVG2stRGR-rUAXABRaJjgD-816J5s2Jug0cB_sgfjnTjDWobg@mail.gmail.com>
 <8737g1t1mh.fsf@kamboji.qca.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Mon, 30 Jan 2017 20:56:11 +0800
Message-ID: <CAMVG2sumkYZ4EHeXm-v8GDrQDrF4ZE1BK_etfNCteyoz5a=GVA@mail.gmail.com>
Subject: Re: Incomplete scan results after rf(un)kill
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 30 January 2017 at 16:04, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Daniel J Blueman <daniel@quora.org> writes:
>
>> On 27 January 2017 at 23:44, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>>> Daniel J Blueman <daniel@quora.org> writes:
>>>
>>>> On 4.9.5 and previous, I've noticed that 20% of the time after
>>>> rfunkilling, AP scan results would often have only 1-2 out of the
>>>> previous 10 APs, and the situation would persist until removing and
>>>> reinserting the ath10k_pci module.
>>>>
>>>> This is on my Dell XPS 13 9360 (Kaby Lake) with current BIOS 1.2.3 on
>>>> Ubuntu (ElementaryOS) 16.04 with updates.
>>>>
>>>> Could this have any relation to the missing firmware [1]?
>>>>
>>>> What state can I capture to help diagnose this?
>>>
>>> Do you see any pattern what APs are visible when the bug happens? For
>>> example, are those 1-2 APs always the same one? And are they ones with
>>> strongest signal strength or maybe related to certain channels?
>>>
>>> After the bug happens how does the device work otherwise? Have you
>>> tested performance (iperf) or signal strength? Is there any packet loss
>>> etc?
>>
>> Many thanks for following up Kalle! Interestingly, I do see the same
>> subset of APs (but not the strongest) in the Networkmanager GUI,
>> however when I scan from the CLI, nothing:
>>
>> # nmcli dev wifi
>> *  SSID  MODE  CHAN  RATE  SIGNAL  BARS  SECURITY
>> #
>
> Better to use 'sudo iw wlan0 scan' (or whatever is the ath10k network
> interface name in your setup, systemd has made guessing the name
> difficult). That provides more information and communicates directly
> with kernel.

Good tip; I'll harvest this info at next occurrence.

>> The issue also occurs when coming out of suspend. I didn't check dmesg
>> other times, but this may or may not be related:
>>
>> [  204.454815] WARNING: CPU: 3 PID: 0 at
>> /home/kernel/COD/linux/net/core/dev.c:5161 net_rx_action+0x26e/0x380
>
> It may very well be. Do you know exactly to what warning that line 5161
> points to in your kernel version? With latest ath.git master branch line
> 5182 in dev.c is this warning napi_poll():
>
>         WARN_ON_ONCE(work > weight);
>
> But I do not know if you are seeing that warning or something else
> because my kernel sources doesn't match what you use.

I'm using the ubuntu mainline builds; WARN_ON_ONCE(work > weight) is
at line 5161 in dev.c in 4.9.6.

Thanks,
  Daniel
-- 
Daniel J Blueman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
