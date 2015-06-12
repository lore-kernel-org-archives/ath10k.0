Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3TUJ-00038K-74
 for ath10k@lists.infradead.org; Fri, 12 Jun 2015 18:15:31 +0000
Received: by iebgx4 with SMTP id gx4so29269891ieb.0
 for <ath10k@lists.infradead.org>; Fri, 12 Jun 2015 11:15:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH3pVZOqopWzt_R8ot+OkFKTOz64wv83swKDM+K+=u0=bYpcNw@mail.gmail.com>
References: <CAH3pVZP4KNrRSUqfLk1dEOGVTBZK27VOWMVBfL1+49ygC8oOTQ@mail.gmail.com>
 <CA+BoTQkjfiO-hZe+ngvRe0NCK=GroTMCeXuNNn9eb+BnRq+MJg@mail.gmail.com>
 <557AE216.5020105@candelatech.com>
 <CAH3pVZOqopWzt_R8ot+OkFKTOz64wv83swKDM+K+=u0=bYpcNw@mail.gmail.com>
Date: Fri, 12 Jun 2015 11:15:08 -0700
Message-ID: <CAJ-VmokEE+8L0vzPkKriaw2ivgKh-nRE--siYSaL7u379Otj_w@mail.gmail.com>
Subject: Re: ath10k fw_stats rx_frame/rx_clear counters
From: Adrian Chadd <adrian@freebsd.org>
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
To: Sergey Naumov <sknaumov@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I'll go see if I can dig up how this works on the 11ac NICs. I have a
sneaking suspicion that the ext20, ext40, ext80 channel bits are
making things different.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
