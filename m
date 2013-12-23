Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x233.google.com ([2a00:1450:4008:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vv0Ep-0002Zf-7A
 for ath10k@lists.infradead.org; Mon, 23 Dec 2013 07:47:44 +0000
Received: by mail-bk0-f51.google.com with SMTP id 6so1947120bkj.10
 for <ath10k@lists.infradead.org>; Sun, 22 Dec 2013 23:47:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87wqiz24my.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
 <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
 <CAEFj984cDmJOuAov_=2vR_4h3TwZY0LMs=pWG7TFAcv_u1=HJA@mail.gmail.com>
 <87wqiz24my.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 23 Dec 2013 15:47:20 +0800
Message-ID: <CAEFj985MVPA_e2tKqsnUMqdsGsiaEE49x9sk+hGkZev8fHMX4A@mail.gmail.com>
Subject: Re: Unable to receive beacon in IBSS mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

Hi, Kalle Valo

It seems that the problem of adhoc mode is due to the get_tsf is not
implemented in the driver.

Can you point out which WMI command that we can use to fetch the TSF timestamp.

Thanks

----
Chun-Yeow

On Fri, Dec 20, 2013 at 6:33 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>> ath10k: qca988x hw2.0 (0x4100016c) fw 999.999.0.636 api 2 htt 2.1
>>
>> The firmware version is 999.999.0.636.
>
> Ok, that's the firmware version I would recommend to start with. You
> could try 10.1 version, but I doubt it works any better with IBSS.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
