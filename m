Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eVhcA-0002JJ-Pr
 for ath10k@lists.infradead.org; Sun, 31 Dec 2017 17:41:40 +0000
Received: by mail-wr0-x229.google.com with SMTP id p17so21594505wre.7
 for <ath10k@lists.infradead.org>; Sun, 31 Dec 2017 09:41:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171231172925.24014-1-erik.stromdahl@gmail.com>
References: <20171231172925.24014-1-erik.stromdahl@gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Sun, 31 Dec 2017 09:41:26 -0800
Message-ID: <CALLGbRLrHfU6sURKOr=NQUrep9dRGhU5qsYLmCuwe0_CWnuy6w@mail.gmail.com>
Subject: Re: [RFC v4 00/18] ath10k high latency
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Erik,

On Sun, Dec 31, 2017 at 9:29 AM, Erik Stromdahl
<erik.stromdahl@gmail.com> wrote:
> Uplink test results (WUSB6100M -> other computer):
>
> # iperf-client.sh 192.168.1.244
> /usr/bin/iperf
> ------------------------------------------------------------
> Client connecting to 192.168.1.244, TCP port 1234
> TCP window size: 85.0 KByte (default)
> ------------------------------------------------------------
> [  3] local 192.168.1.190 port 50524 connected with 192.168.1.244 port
> 1234
> [ ID] Interval       Transfer     Bandwidth
> [  3]  0.0-10.1 sec  10.8 MBytes  8.95 Mbits/sec
>
> The result is not so good (I expect more from an 11ac device),
> but hopefully it is configuration related.
>

Indeed. As a point of reference, an AR6004 device I have on my desk
(which is a/b/g/n, no ac), built into a custom SBC, I can normally get
iperf runs of >35 Mbits/sec.  So, in short, that run is showing
there's an issue. I don't have your device so I can't really help out
much more than that, but in the next week or so I'll try to look at
the patches and see if something pops to my eye.

- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
