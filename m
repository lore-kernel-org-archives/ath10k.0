Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V08DB-000489-FW
 for ath10k@lists.infradead.org; Fri, 19 Jul 2013 10:46:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: Firmware crash after removing VAP
References: <51E70AB4.7080307@candelatech.com>
 <CA+BoTQk5GtWzmZA=TJqk4dWnMmEqC5fQJGkGguYsuLpTCca0mw@mail.gmail.com>
 <51E77B48.9040005@candelatech.com>
 <CA+BoTQkuy3dwf_GZTO7x_P9po7uHQmcB02bV-TOuJ4euXf=wUA@mail.gmail.com>
Date: Fri, 19 Jul 2013 13:46:26 +0300
In-Reply-To: <CA+BoTQkuy3dwf_GZTO7x_P9po7uHQmcB02bV-TOuJ4euXf=wUA@mail.gmail.com>
 (Michal Kazior's message of "Thu, 18 Jul 2013 07:37:53 +0200")
Message-ID: <87ehau4ykd.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

>> Has anyone been able to successfully use more than one station with
>> ath10k so far?
>
> Well, it works for me on ath branch.
>
> I'm able to successfully associate 2 STA interfaces or a couple of AP
> interfaces through hostapd's multi bssid support.
>
> One thing you should know - it's impossible to associate with two
> ath10k STA interfaces to the same AP. This is a firmware limitation
> and I'm guessing you're trying to do that because 'Failed to add peer'
> is visible in your other logs.

Can you add that to the wiki, please? It would be good to document all
these kind of special cases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
