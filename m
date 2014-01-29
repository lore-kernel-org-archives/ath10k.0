Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Y1I-0000kA-LP
 for ath10k@lists.infradead.org; Wed, 29 Jan 2014 16:29:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: fw_stats available in 10.x FW
References: <CAEFj985_s1Q=S-9EVLySzXkCorQkLn6jNBcVCeDUBqWzCw+A6Q@mail.gmail.com>
Date: Wed, 29 Jan 2014 18:29:17 +0200
In-Reply-To: <CAEFj985_s1Q=S-9EVLySzXkCorQkLn6jNBcVCeDUBqWzCw+A6Q@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Fri, 24 Jan 2014 18:20:50 +0800")
Message-ID: <8761p221lu.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> Try to retrieve the fw_stats on 10.x FW but no information.
>
> Is this supported by the firmware?

Yes, but IIRC you need Bartosz' patches which are not applied yet:

http://lists.infradead.org/pipermail/ath10k/2013-September/000317.html

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
