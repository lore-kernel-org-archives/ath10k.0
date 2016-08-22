Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from snt004-omc2s10.hotmail.com ([65.55.90.85])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbsJO-0004AD-Ld
 for ath10k@lists.infradead.org; Mon, 22 Aug 2016 16:43:00 +0000
From: Peter Oh <ebmajor@live.com>
Subject: Re: Issue with ATH10K driver while bringing up mesh interface
Date: Mon, 22 Aug 2016 16:42:20 +0000
Message-ID: <09b6c230448b4e8b80a47f09c8f5a7ccf0f4fe819eb74a49b049076a3f10086020984c91a40b481a97dc2a26d81e6b3fBY2PR20MB0248FA35E3C1CF41FEF78CEBDFE80@BY2PR20MB0248.namprd20.prod.outlook.com>
References: <20160816035841.M15556@universe.cdotb.ernet.in>
 <6fe9261b-c662-3b89-b78b-d492e013648a@gentrice.net>
 <20160816044306.M74655@cdot.in>
 <8ec31d40-4a01-ed24-ed2e-3be351aab5d5@gentrice.net>
 <20160816091707.M1726@cdot.in>,<1471374073.3432.8.camel@qca.qualcomm.com>
In-Reply-To: <1471374073.3432.8.camel@qca.qualcomm.com>
Content-Language: en-US
Content-ID: <69429DE539E9BC42B6FF430E4C715C4A@namprd20.prod.outlook.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Pedersen, Thomas" <twp@qca.qualcomm.com>, Sridhar Konabathini <sridhark@cdot.in>
Cc: "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Horse <horse@gentrice.net>

re-send in plain text mode.
> >=A0



> > Please try=A0 "insmod ath10k_core.ko rawmode=3D1"
> > =

I recommend you to use =A0FW version=A010.2.4.70.12-2 or higher, so that yo=
u don't have to use raw mode. Main downside using raw mode is throughput th=
rottled.
You can get the ath10k firmware from=A0https://github.com/kvalo/ath10k-firm=
ware.


Peter

     =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
