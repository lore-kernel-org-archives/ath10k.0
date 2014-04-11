Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x233.google.com ([2607:f8b0:400c:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYPmy-0004V9-Ds
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 00:57:57 +0000
Received: by mail-vc0-f179.google.com with SMTP id ij19so4240815vcb.10
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 17:57:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGsNzDKvcp453sPLMEa1DTmstCoQT-hVCc=nPucSnmOp3PrerA@mail.gmail.com>
References: <CAGsNzDJ4hDBa82bUFTQkUqjuRuKOaOVMJDsFZUUvdPGf+iKBdQ@mail.gmail.com>
 <CAEFj985jaYoB0fgoY7G0vstcPJTTtGGLy_unAaTWUKvKGDwChw@mail.gmail.com>
 <CAGsNzD+vQosTK8-ikrxwzrSXY8kzc+GHg5QutB8KdNsHCE8-9w@mail.gmail.com>
 <CAGsNzDKvcp453sPLMEa1DTmstCoQT-hVCc=nPucSnmOp3PrerA@mail.gmail.com>
Date: Fri, 11 Apr 2014 08:57:29 +0800
Message-ID: <CAEFj984r21nCirRaTm4qr3qTcjm9Rf3xPs8Fr2P2XeaodvaeHg@mail.gmail.com>
Subject: Re: WDS and adhoc support with ath10k
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Aaron Ray <aaronmray@ohioitguy.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Take a look on hostapd.conf, and if you have set bridge parameter,
then WDS is turned on in AP mode.

bridge=br0

# WDS (4-address frame) mode with per-station virtual interfaces
# (only supported with driver=nl80211)
# This mode allows associated stations to use 4-address frames to allow layer 2
# bridging to be used.
#wds_sta=1

# If bridge parameter is set, the WDS STA interface will be added to the same
# bridge by default. This can be overridden with the wds_bridge parameter to
# use a separate bridge.
#wds_bridge=wds-br0

-----
Chun-Yeow

On Fri, Apr 11, 2014 at 7:20 AM, Aaron Ray <aaronmray@ohioitguy.com> wrote:
> Thanks for the response. I'm currently in AP mode, and this was the result:
>
> root@OpenWrt:~# iw dev wlan0 set 4addr on
> command failed: Operation not supported (-122)
>
> I thought for sure that command was going to fix it. The link seems to
> be up and running fine, it's the extended addressing that seems to not
> be working. I've noticed arp requests are going unanswered.
>
> On Thu, Apr 10, 2014 at 7:19 PM, Aaron Ray <aaronmray@ohioitguy.com> wrote:
>> Thanks for the response. I'm currently in AP mode, and this was the result:
>>
>> root@OpenWrt:~# iw dev wlan0 set 4addr on
>> command failed: Operation not supported (-122)
>>
>> I thought for sure that command was going to fix it. The link seems to be up
>> and running fine, it's the extended addressing that seems to not be working.
>> I've noticed arp requests are going unanswered.
>>
>>
>> On Thu, Apr 10, 2014 at 2:17 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
>> wrote:
>>>
>>> Just make sure that the adhoc mode is working first before proceed to WDS.
>>>
>>> Be sure the firmware version is as follow:
>>> [   13.810000] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
>>> 999.999.0.636 api 2 htt 2.1
>>>
>>> I haven't tried the adhoc mode with WDS, but did try for managed and
>>> AP interface.
>>>
>>> I think that you need to turn on the 4addr flag in iw:
>>> iw dev wlan0 set 4addr on
>>>
>>> ----
>>> Chun-Yeow
>>>
>>> On Thu, Apr 10, 2014 at 12:07 AM, Aaron Ray <aaronmray@ohioitguy.com>
>>> wrote:
>>> > I've been exploring WDS support in OpenWRT and ath10k. I'm running the
>>> > latest openwrt trunk as of this weekend and I'm NOT able to get WDS
>>> > working on my ath10k card.
>>> >
>>> > No sta adapter is created also iw doesn't list any support for WDS.
>>> > I'd like to get this working if anyone has any ideas.
>>> >
>>> > _______________________________________________
>>> > ath10k mailing list
>>> > ath10k@lists.infradead.org
>>> > http://lists.infradead.org/mailman/listinfo/ath10k
>>
>>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
