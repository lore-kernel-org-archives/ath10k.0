Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agGbw-0004Cb-83
 for ath10k@lists.infradead.org; Wed, 16 Mar 2016 18:56:01 +0000
Received: by mail-qk0-x22c.google.com with SMTP id o6so25089971qkc.2
 for <ath10k@lists.infradead.org>; Wed, 16 Mar 2016 11:55:39 -0700 (PDT)
Date: Wed, 16 Mar 2016 14:55:31 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [RFCv2 0/3] mac80211: implement fq codel
Message-ID: <20160316185531.GA1771@localhost>
References: <1458123478-1795-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=65mHN5iLnZjTE+tyEG7nfmCx4NZNbGRF6+VpRaNmOYw@mail.gmail.com>
 <CAA93jw5cUaj_qM+CYHHoRaghLDLC+BUgF4AjT=Oec+SB-zb74g@mail.gmail.com>
 <CAA93jw6tDdiYuginPbUY1DFJLiDxofHMFN6j2BvQPabPmBtuRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA93jw6tDdiYuginPbUY1DFJLiDxofHMFN6j2BvQPabPmBtuRw@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Michal Kazior <michal.kazior@tieto.com>, make-wifi-fast@lists.bufferbloat.net

On Wed, Mar 16, 2016 at 11:36:31AM -0700, Dave Taht wrote:
> That is the sanest 802.11e queue behavior I have ever seen!  (at both
> 6 and 300mbit! in the ath10k patched mac test)

Out of curiosity, why does BE have larger latency than BK in that chart?
I'd have expected the opposite.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
