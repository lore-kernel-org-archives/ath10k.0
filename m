Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxVBf-0002r4-CK
 for ath10k@lists.infradead.org; Wed, 27 May 2015 06:51:36 +0000
Received: by iepj10 with SMTP id j10so6624031iep.3
 for <ath10k@lists.infradead.org>; Tue, 26 May 2015 23:51:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150428122554.GA4527@localhost>
References: <20150424125055.GA27722@localhost>
 <CAEFj986N0UnCnzFWLTd=MkSWRU0jOG36N4SVepkmXPnaLX__0g@mail.gmail.com>
 <553AEFFA.6010709@candelatech.com>
 <20150426141552.GA25938@localhost>
 <20150427130016.GA28926@localhost>
 <CA+BoTQmrboeJOw0J67PWkbjteh38xrWntivvBKSWY1MBQ=B6Dg@mail.gmail.com>
 <20150428122554.GA4527@localhost>
Date: Wed, 27 May 2015 08:51:05 +0200
Message-ID: <CACKGw+Hict+GwUQMvUph7U0Oanr-jEgLfWJyODxh_S-OG54GUg@mail.gmail.com>
Subject: Re: attempting mesh on ath10k
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 28 April 2015 at 14:25, Bob Copeland <me@bobcopeland.com> wrote:
> On Tue, Apr 28, 2015 at 07:47:40AM +0200, Michal Kazior wrote:
>> > Perhaps there is a BSSID filter enabled or something like that (in mesh
>> > there's no BSSID, just individual addresses on group addressed frames).
>>
>> In that case try creating a monitor interface and bring it up. This
>> should prompt ath10k to create monitor vdev and subsequently disable
>> most Rx filters in firmware.

Are there any plans to push this work upstream?

Regards,
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
