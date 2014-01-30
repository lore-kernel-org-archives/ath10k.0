Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8sRw-000869-V3
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 14:18:38 +0000
Received: by mail-bk0-f54.google.com with SMTP id u14so1416838bkz.41
 for <ath10k@lists.infradead.org>; Thu, 30 Jan 2014 06:18:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj986-Ovb5pd7kHO2U=LxA_P73rohvgq6vW5x=+GUamH77hA@mail.gmail.com>
References: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
 <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
 <CAEFj984cDmJOuAov_=2vR_4h3TwZY0LMs=pWG7TFAcv_u1=HJA@mail.gmail.com>
 <87wqiz24my.fsf@kamboji.qca.qualcomm.com>
 <CAEFj985MVPA_e2tKqsnUMqdsGsiaEE49x9sk+hGkZev8fHMX4A@mail.gmail.com>
 <8761p4iems.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986-Ovb5pd7kHO2U=LxA_P73rohvgq6vW5x=+GUamH77hA@mail.gmail.com>
Date: Thu, 30 Jan 2014 22:18:14 +0800
Message-ID: <CAEFj986F=Xs3+uH4Gw_mkqB-gobvCRn-9P3z4hmhyh+rtHLURQ@mail.gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

When bringing up the adhoc interface, all of them will do the
beaconing. mac80211 triggers the call to the driver for getting the
latest TSF and tryto merge or join the IBSS with same SSID.

Here in net/mac80211/ibss.c

                 /*
                  * second best option: get current TSF
                  * (will return -1 if not supported)
                  */
                 rx_timestamp = drv_get_tsf(local, sdata);

In example, ath9k_htc has ath9k_htc_get_tsf, but not ath10k. So I am
wondering whether we have get tsf support in firmware.

---
Chun-Yeow

> On Jan 28, 2014 6:29 PM, "Kalle Valo" <kvalo@qca.qualcomm.com> wrote:
>>
>> Hi,
>>
>> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>>
>> > It seems that the problem of adhoc mode is due to the get_tsf is not
>> > implemented in the driver.
>> >
>> > Can you point out which WMI command that we can use to fetch the TSF
>> > timestamp.
>>
>> I took a quick look at firmware and I didn't find a way to do that. But
>> I'm no firmware engineer so I might have just missed it.
>>
>> Can you describe in more detail how adhoc is failing?
>>
>> --
>> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
