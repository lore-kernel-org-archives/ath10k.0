Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5os4-0000iD-MY
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 09:15:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id l10-v6so5569693wrp.3
 for <ath10k@lists.infradead.org>; Fri, 28 Sep 2018 02:15:26 -0700 (PDT)
MIME-Version: 1.0
From: Gilbert Moisio <gmoisio@gmail.com>
Date: Fri, 28 Sep 2018 11:15:16 +0200
Message-ID: <CAM8JFhAqNw0GLE2bA7amMYt9oSo2Y8RHTNKSPetFjSccCE5fFg@mail.gmail.com>
Subject: WLE900VX / QCA9880 poor TCP performances
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
To: ath10k@lists.infradead.org

Hi, using linux-firmware 1.173.1 as well as 1.175 with Ubuntu 18.04
kernel 4.15.0-34-generic, I got poor TCP performances.

For a connection with a Data Rates going from 975 Mbps to 1,170 Mbps I
got the following results with Iperf3 3.1.3:

UDP during 60 secondes:
Max --> 480 Mbps
Min --> 318 Mbps
0.92% lost

TCP during 60 secondes:
Start with slow throughput during 20s
Max --> 244 Mbps
Min --> 21.5 Mbps
Avr --> 177 Mbps

Thanks
Regards

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
