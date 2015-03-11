Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVjPn-00047W-9m
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 16:23:24 +0000
Message-ID: <1426090976.1904.7.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: strip qos data bit always
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 11 Mar 2015 17:22:56 +0100
In-Reply-To: <1426080326-14764-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20150311_142751_625852_7560ADDB)
References: <1426080326-14764-1-git-send-email-michal.kazior@tieto.com>
 (sfid-20150311_142751_625852_7560ADDB)
Mime-Version: 1.0
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2015-03-11 at 14:25 +0100, Michal Kazior wrote:
> NativeWifi tx mode expects QoS Data frames to be
> delivered as Data frames with QoS part (e.g. tid)
> being delievered out-of-band in fw tx command.
> 
> The QoS bit wasn't stripped before submitting to
> firmware.
> 
> Stripping fixes two known problems:
> 
>  * qca6174 IOT with some APs, e.g.
>    Cisco AIR-AP 1252 (which would crash after
>    ath10k association). Some ath9k APs would
>    crash as well.

It would probably be interesting to figure out why and fix that - this
is clearly a major issue.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
