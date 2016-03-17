Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agVri-0003B1-E7
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 11:13:20 +0000
Received: by mail-qk0-x22f.google.com with SMTP id o6so33463016qkc.2
 for <ath10k@lists.infradead.org>; Thu, 17 Mar 2016 04:12:58 -0700 (PDT)
Date: Thu, 17 Mar 2016 07:12:48 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [RFCv2 0/3] mac80211: implement fq codel
Message-ID: <20160317111248.GC1238@localhost>
References: <1458123478-1795-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=65mHN5iLnZjTE+tyEG7nfmCx4NZNbGRF6+VpRaNmOYw@mail.gmail.com>
 <CAA93jw5cUaj_qM+CYHHoRaghLDLC+BUgF4AjT=Oec+SB-zb74g@mail.gmail.com>
 <CAA93jw6tDdiYuginPbUY1DFJLiDxofHMFN6j2BvQPabPmBtuRw@mail.gmail.com>
 <20160316185531.GA1771@localhost>
 <CAGyitvMDEUiNx7HD=XKjXNHnFvZ_gxD_BbQx3AP-57_+dBeD4A@mail.gmail.com>
 <CA+BoTQnFN6VANn=5EUvHc0Dbfh4Zv0HraOto2ySN3_HdOpD7Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQnFN6VANn=5EUvHc0Dbfh4Zv0HraOto2ySN3_HdOpD7Sg@mail.gmail.com>
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
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Jasmine Strong <jas@eero.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, make-wifi-fast@lists.bufferbloat.net

On Thu, Mar 17, 2016 at 09:55:03AM +0100, Michal Kazior wrote:
> If you consider Wi-Fi is half-duplex and latency in the entire stack
> (for processing ICMP and UDP_RR) is greater than 11e contention window
> timings you can get your BE flow responses with extra delay (since
> other queues might have responses ready quicker).

Got it, that makes sense.  Thanks for the explanation!

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
