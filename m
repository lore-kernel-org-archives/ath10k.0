Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WoSvn-0004oD-8K
 for ath10k@lists.infradead.org; Sun, 25 May 2014 07:33:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: help troubleshooting low throughput
References: <CAJ+vNU23qE-H0cp9fGams0h3xVJqNJQKNgX-2r0mPiV8ioz_rA@mail.gmail.com>
 <CAJ+vNU09pWS9+mheetHtvQfQACHDNfjzchkCc3zGBOWD7ef02w@mail.gmail.com>
 <CA+BoTQnYB8JESb7cvmivMM0WY_OC51WcuGp3aynwcmQTUxztpA@mail.gmail.com>
 <CAJ+vNU2eHHBQBFBbiRjntMn9qg_tXMpVcnkKtsV7KvXtXizVDA@mail.gmail.com>
 <CA+BoTQk_G=UA-FsXOU+eoveYWLCLqs67Xj6muNUPVzKBdEL0-Q@mail.gmail.com>
 <CAJ+vNU0KuGgGYVUyNbO=TTwH_P0zGszmFt6dBMWLNiO7APW0kw@mail.gmail.com>
Date: Sun, 25 May 2014 10:32:52 +0300
In-Reply-To: <CAJ+vNU0KuGgGYVUyNbO=TTwH_P0zGszmFt6dBMWLNiO7APW0kw@mail.gmail.com>
 (Tim Harvey's message of "Fri, 23 May 2014 22:32:59 -0700")
Message-ID: <87r43itisb.fsf@kamboji.qca.qualcomm.com>
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
To: Tim Harvey <tharvey@gateworks.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Tim Harvey <tharvey@gateworks.com> writes:

>> Also, now that I think about you don't have a bridge. This means your
>> AP system has to perform a lot more packet mangling which I guess can
>> be pretty taxing for the A9.
>>
>
> yep - turns out it is a cpu bottleneck. I'm not sure what I was
> looking at when I checked the performance before but now I see that I
> am hitting 100% utilization.
>
> Putting the AP in a bridge and moving iperf off of it, brings up my
> TCP bandwidth to 240mbps (at which point the STA running iperf is 100%
> pegged) and 463mbps UDP (at which point the AP was 100% pegged).

Did you check that you had all kernel debug options disabled, including
ath10k debug options? Kernel debugging code can significantly decrease
maximum throughput.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
