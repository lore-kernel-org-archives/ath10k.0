Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W85vC-0000yP-CY
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 10:29:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Unable to receive beacon in IBSS mode
References: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
 <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
 <CAEFj984cDmJOuAov_=2vR_4h3TwZY0LMs=pWG7TFAcv_u1=HJA@mail.gmail.com>
 <87wqiz24my.fsf@kamboji.qca.qualcomm.com>
 <CAEFj985MVPA_e2tKqsnUMqdsGsiaEE49x9sk+hGkZev8fHMX4A@mail.gmail.com>
Date: Tue, 28 Jan 2014 12:28:59 +0200
In-Reply-To: <CAEFj985MVPA_e2tKqsnUMqdsGsiaEE49x9sk+hGkZev8fHMX4A@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Mon, 23 Dec 2013 15:47:20 +0800")
Message-ID: <8761p4iems.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Hi,

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> It seems that the problem of adhoc mode is due to the get_tsf is not
> implemented in the driver.
>
> Can you point out which WMI command that we can use to fetch the TSF timestamp.

I took a quick look at firmware and I didn't find a way to do that. But
I'm no firmware engineer so I might have just missed it.

Can you describe in more detail how adhoc is failing?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
