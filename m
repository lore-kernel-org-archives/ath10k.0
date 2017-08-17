Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diF0z-00039M-Ha
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 07:14:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
Date: Thu, 17 Aug 2017 07:14:21 +0000
Message-ID: <87pobu4qer.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
 <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhBEkiRoyO+10ShcU2UDbz3a+zFxKVvxkipvqd2e3B9u3w@mail.gmail.com>
 <87valn5vhs.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhCpWBDv=_rZ_KDTsQ008wjUgv5nix=kxv-RPd2035xGLQ@mail.gmail.com>
 <CAPYrjBUrEuuxpO=KYi1EXh-bZU2sPNLEsnNZnnp6_w1viss3wQ@mail.gmail.com>
In-Reply-To: <CAPYrjBUrEuuxpO=KYi1EXh-bZU2sPNLEsnNZnnp6_w1viss3wQ@mail.gmail.com>
 (Kouroche Bouchiat's message of "Wed, 16 Aug 2017 16:51:54 +0000")
Content-Language: en-US
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
To: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>
Cc: Gilbert Moisio <gmoisio@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kouroche Bouchiat <kouroche.bouchiat@gmail.com> writes:

> Uhm Hello, thank you for the reply Kalle.
> I'm lost. I submitted the original issue about the QCA6174.
>
> I'll try your firmware tonight on my laptop. I've been using
> firmware-4.bin for a week and I haven't had any issues. I'll tell you
> how it performs and attach my dmesg as soon as I can.

I was told that 4.4.1 firmare should have a fix for this. Please let me
know if you can confirm that and then I'll update the firmware in
linux-firmware.

> I was indeed connected to a WPA network. If rekeying happens in
> periodic patterns like that, then it could be where the issue is. I
> can try to see if it occurs on open networks too, if you like.

Yes, WPA rekey is initiated periodically by the AP. Some APs have a
setting in UI to configure the period but not all. But don't bother to
changing WPA rekeying time that as I'm optimistic that 4.4.1 branch has
a fix for your issue.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
