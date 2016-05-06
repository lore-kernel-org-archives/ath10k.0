Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayis6-00069C-CY
 for ath10k@lists.infradead.org; Fri, 06 May 2016 16:44:58 +0000
Received: by mail-qk0-x232.google.com with SMTP id n63so63154191qkf.0
 for <ath10k@lists.infradead.org>; Fri, 06 May 2016 09:44:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvo3no44.fsf@kamboji.qca.qualcomm.com>
References: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
 <20160506013252.GB28948@localhost>
 <CAOiRWuUYKDVOd8VSWqs19O6TkrntDQ8jDK09jmYT94Umy8RSag@mail.gmail.com>
 <CAEFj986GBi+esFMUJVULfyVU8sGQ7ycqdVH9Esjkza0Ec+BtCw@mail.gmail.com>
 <CA+uUJGvb6gtFK9xHitL36VHK25BW1jcBVkv__GUid_K7sVraHw@mail.gmail.com>
 <CAEFj985MbGeVUdgw--y6HzR8da2qm=XJ1ggPvkNZZ46n5Mpxow@mail.gmail.com>
 <CAOiRWuXhVWGRvt1_4p0KVg=DmAey=trjK2Fx7GtXtFUrnS23GA@mail.gmail.com>
 <87mvo3no44.fsf@kamboji.qca.qualcomm.com>
Date: Sat, 7 May 2016 00:44:37 +0800
Message-ID: <CAEFj987fZ5he-vj_sTnpqMHyNkb07vp6RfqNm6SysLmLAs4=bg@mail.gmail.com>
Subject: Re: 802.11s channel width settings?
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Zach Sherin <zach@netblazr.com>, Bob Copeland <me@bobcopeland.com>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Zach,

I have submitted a patch so that you can configure the VHT80 using
/etc/config/wireless in openwrt, refer here:
https://lists.openwrt.org/pipermail/openwrt-devel/2016-May/041350.html

---
Chun-Yeow

On Sat, May 7, 2016 at 12:32 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Zach Sherin <zach@netblazr.com> writes:
>
>> Thanks! I mostly am interested in knowing the modulation just to keep
>> track of my theoretical maximum throughput for monitoring. The Rx rate
>> was changing correctly now, which is great. I know the Tx rate is
>> totally unreported, but the Rx is all I need. Thanks again for all the
>> assistance, I think I have everything I need.
>
> IIRC you should actually see the TX rate from fw_stats debugfs file.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
