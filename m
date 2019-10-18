Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLT2I-0006hv-BT
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 14:15:23 +0000
Message-ID: <32a96b6ad48387876b7125adba147578564d297a.camel@sipsolutions.net>
Subject: Re: [Make-wifi-fast] [PATCH v2 4/4] mac80211: Use Airtime-based
 Queue Limits (AQL) on packet dequeue
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 18 Oct 2019 16:15:11 +0200
In-Reply-To: <CA+iem5v-K0pA9WLfDNxBKVjufgH=2MeuGmV0aDJysLT8jdawAQ@mail.gmail.com>
 (sfid-20191018_031141_683850_A491125A)
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115994190.2500430.14955682016008497593.stgit@toke.dk>
 <CA+iem5s=xbzZ5goaBO4tZWUKVQRaXb+SnB34NPCppej9mi8sAA@mail.gmail.com>
 <87o8yfg0zo.fsf@toke.dk> <751EA059-654B-4E06-A3D6-C727FE1FCE98@gmx.de>
 <87lftjfz51.fsf@toke.dk> <18FC6F1D-084C-44BD-87E7-C9F394D6FCD1@gmx.de>
 <CA+iem5v-K0pA9WLfDNxBKVjufgH=2MeuGmV0aDJysLT8jdawAQ@mail.gmail.com>
 (sfid-20191018_031141_683850_A491125A)
MIME-Version: 1.0
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
To: Kan Yan <kyan@google.com>, Sebastian Moeller <moeller0@gmx.de>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

On Thu, 2019-10-17 at 18:11 -0700, Kan Yan wrote:
> I don't think it is hard to take care of extra header size for frames
> with VLAN tags

VLAN tags are payload as far as wifi is concerned, so no need to take
that into account ...

johannes



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
