Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from g4t3428.houston.hp.com ([15.201.208.56])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agbfw-0008DZ-Bx
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 17:25:33 +0000
Subject: Re: [Codel] [RFCv2 0/3] mac80211: implement fq codel
References: <1458123478-1795-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=65mHN5iLnZjTE+tyEG7nfmCx4NZNbGRF6+VpRaNmOYw@mail.gmail.com>
 <CAA93jw5cUaj_qM+CYHHoRaghLDLC+BUgF4AjT=Oec+SB-zb74g@mail.gmail.com>
 <CAA93jw6tDdiYuginPbUY1DFJLiDxofHMFN6j2BvQPabPmBtuRw@mail.gmail.com>
 <20160316185531.GA1771@localhost>
 <CAGyitvMDEUiNx7HD=XKjXNHnFvZ_gxD_BbQx3AP-57_+dBeD4A@mail.gmail.com>
 <CA+BoTQnFN6VANn=5EUvHc0Dbfh4Zv0HraOto2ySN3_HdOpD7Sg@mail.gmail.com>
 <CAA93jw7TuBLVi9k-+2=J27j-Qs+sS3UNaQNTMF9D2MQ13fQY9A@mail.gmail.com>
From: Rick Jones <rick.jones2@hpe.com>
Message-ID: <56EAE85F.3010407@hpe.com>
Date: Thu, 17 Mar 2016 10:24:47 -0700
MIME-Version: 1.0
In-Reply-To: <CAA93jw7TuBLVi9k-+2=J27j-Qs+sS3UNaQNTMF9D2MQ13fQY9A@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Dave Taht <dave.taht@gmail.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: make-wifi-fast@lists.bufferbloat.net, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Jasmine Strong <jas@eero.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Network Development <netdev@vger.kernel.org>

On 03/17/2016 10:00 AM, Dave Taht wrote:
> netperf's udp_rr is not how much traffic conventionally behaves. It
> doesn't do tcp slow start or congestion control in particular...

Nor would one expect it to need to, unless one were using "burst mode" 
to have more than one transaction inflight at one time.

And unless one uses the test-specific -e option to provide a very crude 
retransmission mechanism based on a socket read timeout, neither does 
UDP_RR recover from lost datagrams.

happy benchmarking,

rick jones
http://www.netperf.org/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
