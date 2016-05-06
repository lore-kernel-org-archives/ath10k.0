Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayiKY-0007U1-Ad
 for ath10k@lists.infradead.org; Fri, 06 May 2016 16:10:19 +0000
Received: by mail-yw0-x231.google.com with SMTP id g133so191018538ywb.2
 for <ath10k@lists.infradead.org>; Fri, 06 May 2016 09:09:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj985MbGeVUdgw--y6HzR8da2qm=XJ1ggPvkNZZ46n5Mpxow@mail.gmail.com>
References: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
 <20160506013252.GB28948@localhost>
 <CAOiRWuUYKDVOd8VSWqs19O6TkrntDQ8jDK09jmYT94Umy8RSag@mail.gmail.com>
 <CAEFj986GBi+esFMUJVULfyVU8sGQ7ycqdVH9Esjkza0Ec+BtCw@mail.gmail.com>
 <CA+uUJGvb6gtFK9xHitL36VHK25BW1jcBVkv__GUid_K7sVraHw@mail.gmail.com>
 <CAEFj985MbGeVUdgw--y6HzR8da2qm=XJ1ggPvkNZZ46n5Mpxow@mail.gmail.com>
Date: Fri, 6 May 2016 12:09:56 -0400
Message-ID: <CAOiRWuXhVWGRvt1_4p0KVg=DmAey=trjK2Fx7GtXtFUrnS23GA@mail.gmail.com>
Subject: Re: 802.11s channel width settings?
From: Zach Sherin <zach@netblazr.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Bob Copeland <me@bobcopeland.com>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks! I mostly am interested in knowing the modulation just to keep
track of my theoretical maximum throughput for monitoring. The Rx rate
was changing correctly now, which is great. I know the Tx rate is
totally unreported, but the Rx is all I need. Thanks again for all the
assistance, I think I have everything I need.

Zach

On Fri, May 6, 2016 at 11:56 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Rate control is done in HW. Not minstrel. Tx Rate reporting is not
> there in "iw mesh0 station dump", only Rx Rate.
>
> But by the way, you can set the tx bit rate manually. Refer:
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/debug
>
> ----
> Chun-Yeow
>
> On Fri, May 6, 2016 at 11:49 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
>>
>> On May 6, 2016 11:30 PM, "Yeoh Chun-Yeow" <yeohchunyeow@gmail.com> wrote:
>>>
>>> Try use the "iw wlanX station dump" and check the rx bitrate.
>>
>> Just curious, wouldn't the rate control algorithm change the rate? Minstrel
>> HT - the default one?
>>
>> I mean, can one actually fix the settings such as VHT MCS 9 + 3 Streams +
>> Short GI + 80 MHz channel width and every frame that is sent out *obeys*
>> this fixed setting? It would be interesting to know if there is any such way
>> - helpful for experimental measurement studies :)
>>
>> Raj Joshi
>>
>>> ----
>>> Chun-Yeow
>>>
>>> On Fri, May 6, 2016 at 10:28 PM, Zach Sherin <zach@netblazr.com> wrote:
>>> > That is embarrassing that I trusted OpenWRT to have tried that. It
>>> > would appear that I can set the frequency manually. Thank you!
>>> >
>>> > On a related note, is there any way to check the modulation that the
>>> > radio is using?  I'd like to check all the parameters possible in
>>> > order to understand my throughput numbers.
>>> >
>>> > Thanks again for the fix!
>>> > Zach
>>> >
>>> > On Thu, May 5, 2016 at 9:32 PM, Bob Copeland <me@bobcopeland.com> wrote:
>>> >> On Thu, May 05, 2016 at 02:51:27PM -0400, Zach Sherin wrote:
>>> >>> Is there any way to increase channel widths in 802.11s? If this is an
>>> >>> OpenWRT question and not ath10k I'll head over to the forums, but this
>>> >>> seemed more a driver issue as my wireless config requests wide
>>> >>> channels. Any chance there's a specific version of ath10k I should
>>> >>> push to?
>>> >>
>>> >> I'm not sure about OpenWRT's scripts but you can specify the channel
>>> >> width
>>> >> when setting the frequency (before joining the mesh).
>>> >>
>>> >> E.g.:
>>> >>
>>> >> ip link set wlan0 up
>>> >> iw dev wlan0 set freq 5745 80 5775
>>> >> iw dev wlan0 mesh join my-vht-mesh
>>> >>
>>> >> --
>>> >> Bob Copeland %% http://bobcopeland.com/
>>> >
>>> > _______________________________________________
>>> > ath10k mailing list
>>> > ath10k@lists.infradead.org
>>> > http://lists.infradead.org/mailman/listinfo/ath10k
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
