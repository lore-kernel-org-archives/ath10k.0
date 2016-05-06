Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x236.google.com ([2607:f8b0:4001:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayUe5-0001ct-G9
 for ath10k@lists.infradead.org; Fri, 06 May 2016 01:33:34 +0000
Received: by mail-io0-x236.google.com with SMTP id u185so117190256iod.3
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 18:33:10 -0700 (PDT)
Date: Thu, 5 May 2016 21:32:52 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: 802.11s channel width settings?
Message-ID: <20160506013252.GB28948@localhost>
References: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
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
To: Zach Sherin <zach@netblazr.com>
Cc: ath10k@lists.infradead.org

On Thu, May 05, 2016 at 02:51:27PM -0400, Zach Sherin wrote:
> Is there any way to increase channel widths in 802.11s? If this is an
> OpenWRT question and not ath10k I'll head over to the forums, but this
> seemed more a driver issue as my wireless config requests wide
> channels. Any chance there's a specific version of ath10k I should
> push to?

I'm not sure about OpenWRT's scripts but you can specify the channel width
when setting the frequency (before joining the mesh).

E.g.:

ip link set wlan0 up
iw dev wlan0 set freq 5745 80 5775
iw dev wlan0 mesh join my-vht-mesh

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
