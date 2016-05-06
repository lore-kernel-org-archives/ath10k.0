Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aygju-0005fD-Du
 for ath10k@lists.infradead.org; Fri, 06 May 2016 14:28:23 +0000
Received: by mail-yw0-x231.google.com with SMTP id j74so184681022ywg.1
 for <ath10k@lists.infradead.org>; Fri, 06 May 2016 07:28:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160506013252.GB28948@localhost>
References: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
 <20160506013252.GB28948@localhost>
Date: Fri, 6 May 2016 10:28:01 -0400
Message-ID: <CAOiRWuUYKDVOd8VSWqs19O6TkrntDQ8jDK09jmYT94Umy8RSag@mail.gmail.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: ath10k@lists.infradead.org

That is embarrassing that I trusted OpenWRT to have tried that. It
would appear that I can set the frequency manually. Thank you!

On a related note, is there any way to check the modulation that the
radio is using?  I'd like to check all the parameters possible in
order to understand my throughput numbers.

Thanks again for the fix!
Zach

On Thu, May 5, 2016 at 9:32 PM, Bob Copeland <me@bobcopeland.com> wrote:
> On Thu, May 05, 2016 at 02:51:27PM -0400, Zach Sherin wrote:
>> Is there any way to increase channel widths in 802.11s? If this is an
>> OpenWRT question and not ath10k I'll head over to the forums, but this
>> seemed more a driver issue as my wireless config requests wide
>> channels. Any chance there's a specific version of ath10k I should
>> push to?
>
> I'm not sure about OpenWRT's scripts but you can specify the channel width
> when setting the frequency (before joining the mesh).
>
> E.g.:
>
> ip link set wlan0 up
> iw dev wlan0 set freq 5745 80 5775
> iw dev wlan0 mesh join my-vht-mesh
>
> --
> Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
