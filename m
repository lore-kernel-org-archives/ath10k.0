Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6m2h-0004Sn-DF
 for ath10k@lists.infradead.org; Fri, 24 Jan 2014 19:03:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Anyone done long term testing?
References: <52E29ABF.9040403@candelatech.com>
Date: Fri, 24 Jan 2014 21:03:23 +0200
In-Reply-To: <52E29ABF.9040403@candelatech.com> (Ben Greear's message of "Fri, 
 24 Jan 2014 08:54:23 -0800")
Message-ID: <87eh3x2oec.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> I left an ath10k system up overnight, running 128kbps traffic on each
> of 32 stations, and by morning, the machine was OOM.

Did you see SWBA overrun warnings before the OOM? I saw one report of
such issue. This patch should help with that:

748afc4 ath10k: implement and use new beacon method

> Just curious if anyone had done overnight traffic runs with any luck?

I'm running our AP135 board with ath9k+ath10k as my main AP and have
seen SWBA overruns few times, otherwise it has been pretty stable. But I
haven't yet tested with the patch above to see if the SWBA overruns are
really gone.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
