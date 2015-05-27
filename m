Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxZGI-0006yC-VD
 for ath10k@lists.infradead.org; Wed, 27 May 2015 11:12:39 +0000
Received: by igbhj9 with SMTP id hj9so83777808igb.1
 for <ath10k@lists.infradead.org>; Wed, 27 May 2015 04:12:16 -0700 (PDT)
Date: Wed, 27 May 2015 07:12:11 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: attempting mesh on ath10k
Message-ID: <20150527111211.GC6216@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <553AEFFA.6010709@candelatech.com>
 <20150426141552.GA25938@localhost>
 <20150427130016.GA28926@localhost>
 <CA+BoTQmrboeJOw0J67PWkbjteh38xrWntivvBKSWY1MBQ=B6Dg@mail.gmail.com>
 <20150428122554.GA4527@localhost>
 <CACKGw+Hict+GwUQMvUph7U0Oanr-jEgLfWJyODxh_S-OG54GUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACKGw+Hict+GwUQMvUph7U0Oanr-jEgLfWJyODxh_S-OG54GUg@mail.gmail.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, May 27, 2015 at 08:51:05AM +0200, Bartosz Markowski wrote:
> On 28 April 2015 at 14:25, Bob Copeland <me@bobcopeland.com> wrote:
> > On Tue, Apr 28, 2015 at 07:47:40AM +0200, Michal Kazior wrote:
> >> > Perhaps there is a BSSID filter enabled or something like that (in mesh
> >> > there's no BSSID, just individual addresses on group addressed frames).
> >>
> >> In that case try creating a monitor interface and bring it up. This
> >> should prompt ath10k to create monitor vdev and subsequently disable
> >> most Rx filters in firmware.
> 
> Are there any plans to push this work upstream?

Hi Bartosz,

Yes, I plan to upstream it.  I'm waiting on a hardware to arrive so I can
implement VHT mesh with two ath10k chips; once that's in and working I'll
clean it up and submit.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
