Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMzYS-0004xI-9v
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 15:57:17 +0000
Received: by mail-qk0-x233.google.com with SMTP id u25so289530371qki.2
 for <ath10k@lists.infradead.org>; Fri, 30 Dec 2016 07:56:55 -0800 (PST)
MIME-Version: 1.0
From: Yevgeniy Melnichuk <yevgeniy.melnichuk@googlemail.com>
Date: Fri, 30 Dec 2016 16:56:53 +0100
Message-ID: <CAJKEbddsdO=EkyhZSEwXGgnUpOhG3cAjBTbQsDQLHtLyzPH-VA@mail.gmail.com>
Subject: QCA9377 Bluetooth Audio not working with HSP profile
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

Hi,

when i use my bluetooth headset in A2DP everything works fine, but once i
switch over to HSP it does not work anymore (neither audio nor recording).
Somebody on the pulseaudio bugzilla pointed out, that it might be a problem
with firmware or device configuration. Here is the relevant entry in
buzilla: https://bugs.freedesktop.org/show_bug.cgi?id=97064

i do not know how to go about this problem and would appreciate to have
some assistance. thank you in advance

i am running kernel 4.9.0, bluez 5.43, pulseaudio 9.0.
bluetooth is provided by QCA9377

sudo ethtool -i wlp1s0:
http://pastebin.com/k7qWGUDk

sudo lsusb -s 001:003 -v:
Bus 001 Device 003: ID 13d3:3496 IMC Networks
http://pastebin.com/u1Ndbiz2

lspci -s 01:00.0
01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless
Network Adapter (rev 30)
http://pastebin.com/eEJhewXD

dmesg:
http://pastebin.com/QEcphmTj

please let me know if i can provide further information,
Yevgeniy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
