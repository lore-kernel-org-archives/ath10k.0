Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtxIw-0006P5-4w
 for ath10k@lists.infradead.org; Fri, 20 Dec 2013 10:27:38 +0000
Received: by mail-bk0-f49.google.com with SMTP id my13so1114337bkb.36
 for <ath10k@lists.infradead.org>; Fri, 20 Dec 2013 02:27:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj986wMdEPuh=hRxL=6_CmWGp7eawB82+dq6M+c2EPVj9wNQ@mail.gmail.com>
 <87a9fv3jz0.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 20 Dec 2013 18:27:16 +0800
Message-ID: <CAEFj984cDmJOuAov_=2vR_4h3TwZY0LMs=pWG7TFAcv_u1=HJA@mail.gmail.com>
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

ath10k: qca988x hw2.0 (0x4100016c) fw 999.999.0.636 api 2 htt 2.1

The firmware version is 999.999.0.636.

----
Chun-Yeow

On Fri, Dec 20, 2013 at 6:17 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>> I have observed if you create the interface in the ath10k as IBSS mode
>> (WMI_VDEV_TYPE_IBSS). The ath10k_wmi_event_mgmt_rx is not able to
>> receive the beacon frame. This maybe the reason when the STA up as
>> adhoc mode not able to join the network.
>>
>> But if you put the ath10k as AP mode (WMI_VDEV_TYPE_AP), you are able
>> to receive the beacon.
>>
>> Is this the correct behavior?
>
> I haven't done any IBSS tests myself, but what firmware version are you
> using?
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
