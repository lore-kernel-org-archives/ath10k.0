Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIHNb-0005jt-PB
 for ath10k@lists.infradead.org; Thu, 23 Jul 2015 14:21:48 +0000
Received: by wibud3 with SMTP id ud3so26669097wib.1
 for <ath10k@lists.infradead.org>; Thu, 23 Jul 2015 07:21:24 -0700 (PDT)
Subject: Re: QCA6174 hw2.1 on Clevo P750ZM
References: <55B0A037.8070102@gmail.com>
 <CA+BoTQmvAgeCoHoTvc7XOGcr7x7x49gcJ9WC9t9jo8MjjHNMBg@mail.gmail.com>
 <55B0AA27.2060205@gmail.com>
 <CA+BoTQm-BHp9Gi550xte6F=cK3snYXRK0r=g=9vOn-Y2jde-hQ@mail.gmail.com>
 <55B0B4E7.7040106@gmail.com>
 <CA+BoTQkffQ0UdhF7hvNVaNxtDsOUJLz2qi3vMLp+BM5EsKbk6A@mail.gmail.com>
 <55B0BDD3.4080103@gmail.com>
 <CA+BoTQmceF3xitMz1p6WFp3FVnOme4kpQaK=9ouAjyK4zwbvnQ@mail.gmail.com>
 <55B0C416.90903@gmail.com> <55B0F007.7050408@gmail.com>
 <87oaj3gedw.fsf@kamboji.qca.qualcomm.com>
From: Alexandre Maloteaux <a.maloteaux@gmail.com>
Message-ID: <55B0F854.4060404@gmail.com>
Date: Thu, 23 Jul 2015 15:21:08 +0100
MIME-Version: 1.0
In-Reply-To: <87oaj3gedw.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> What's happening with the features string here? What might cause that?

I used the sumdog binaries from github,maybe this is related. I ll try
with my own firmware-4.bin from dissect/assemble and board.bin from
clevo driver and i ll report if i get the same string

On 07/23/2015 03:03 PM, Kalle Valo wrote:
> Alexandre Maloteaux <a.maloteaux@gmail.com> writes:
>
>> 0x003405ff, 168c:003e:1a56:1525 fallback) fw killer-n1525-fw api 4
>> htt-ver 3.0 wmi-op 4 htt-op 3 cal otp max-sta 32 features
>> \xffffff80\xffffffd4\xffffffa8\xfffffff9\xffffff88\xffffffff\xffffffff
> What's happening with the features string here? What might cause that?
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
